import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mars_curiosity_app/lib/providers/home_provider.dart';
import 'package:mars_curiosity_app/lib/screens/curiosity_detail_screen.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mars Curiosity'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Here, list of picture that taken from Nasa's Mars Curiosity Rovers"),
          ),
          Consumer<HomeProvider>(
            builder: (context, _provider, _) => _provider.curiosityImages == null
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: _provider.fnOnNotification,
                      child: ListView.separated(
                        itemCount: _provider?.curiosityImages?.photos?.length ?? 0,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final _data = _provider.curiosityImages.photos[index];
                          return ListTile(
                            tileColor: Colors.white,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: OctoImage(
                                image: CachedNetworkImageProvider(_data.imgSrc),
                                height: 60,
                                width: 60,
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                ),
                                errorBuilder: OctoError.icon(color: Colors.red),
                                fit: BoxFit.cover,
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                            title: Text(_data.rover.name),
                            subtitle: Text(_data.camera.fullName),
                            onTap: () => Navigator.pushNamed(
                              context,
                              CuriosityDetailScreen.route,
                              arguments: CuriosityDetailScreen(
                                imageSrc: _data.imgSrc,
                                cameraName: _data.camera.fullName,
                                roverName: _data.rover.name,
                                earthDate: _data.earthDate,
                                landingDate: _data.rover.landingDate,
                                launchDate: _data.rover.launchDate,
                                status: _data.rover.status,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(thickness: 2),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
