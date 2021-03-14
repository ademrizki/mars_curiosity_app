import 'package:flutter/material.dart';
import 'package:mars_curiosity_app/lib/providers/curiosity_detail_provider.dart';
import 'package:mars_curiosity_app/lib/providers/home_provider.dart';
import 'package:mars_curiosity_app/lib/screens/curiosity_detail_screen.dart';
import 'package:mars_curiosity_app/lib/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mars Curiosity App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider(),
              child: HomeScreen(),
            ),
        CuriosityDetailScreen.route: (context) => ChangeNotifierProvider<CuriosityDetailProvider>(
              create: (context) => CuriosityDetailProvider(),
              child: CuriosityDetailScreen(),
            ),
      },
    );
  }
}
