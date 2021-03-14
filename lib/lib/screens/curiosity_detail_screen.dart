import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mars_curiosity_app/lib/providers/curiosity_detail_provider.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class CuriosityDetailScreen extends StatelessWidget {
  static const String route = "CuriosityDetailScreen";

  final String imageSrc;
  final String roverName;
  final String cameraName;
  final String earthDate;
  final String landingDate;
  final String launchDate;
  final String status;

  const CuriosityDetailScreen(
      {Key key,
      this.imageSrc,
      this.roverName,
      this.cameraName,
      this.earthDate,
      this.landingDate,
      this.launchDate,
      this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CuriosityDetailScreen _args = ModalRoute.of(context).settings.arguments;
    final _provider = Provider.of<CuriosityDetailProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: RaisedButton(
              child: Row(
                children: [
                  Icon(Icons.share_outlined, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    'Share to WhatsApp',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              color: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onPressed: () => _provider.fnGetScreenShoot(context),
            ),
          ),
        ],
      ),
      body: Screenshot(
        controller: _provider.screenshotController,
        child: Container(
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: OctoImage(
                  image: CachedNetworkImageProvider(_args.imageSrc),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  ),
                  errorBuilder: OctoError.icon(color: Colors.red),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    /// ROVER NAME
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rover: '),
                        Flexible(child: Text(_args.roverName)),
                      ],
                    ),
                    Divider(thickness: 2),
                    SizedBox(height: 5),

                    /// CAMERA NAME
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Camera: '),
                        Flexible(child: Text(_args.cameraName)),
                      ],
                    ),
                    Divider(thickness: 2),
                    SizedBox(height: 5),

                    /// EARTH DATE
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Earth Date: '),
                        Flexible(child: Text(DateFormat('EEEE, dd MMM yyyy').format(DateTime.parse(_args.earthDate)))),
                      ],
                    ),
                    Divider(thickness: 2),
                    SizedBox(height: 5),

                    /// LANDING DATE
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Landing Date: '),
                        Flexible(
                            child: Text(DateFormat('EEEE, dd MMM yyyy').format(DateTime.parse(_args.landingDate)))),
                      ],
                    ),
                    Divider(thickness: 2),
                    SizedBox(height: 5),

                    /// LAUNCH DATE
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Launch Date: '),
                        Flexible(child: Text(DateFormat('EEEE, dd MMM yyyy').format(DateTime.parse(_args.launchDate)))),
                      ],
                    ),
                    Divider(thickness: 2),
                    SizedBox(height: 5),

                    /// ACTIVE STATUS
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status: '),
                        Flexible(child: Text(_args.status.toUpperCase())),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
