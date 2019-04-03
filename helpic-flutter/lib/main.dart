import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_showcase_app/constants/strings_const.dart';
import 'package:flutter_showcase_app/routes.dart';
import 'package:flutter_showcase_app/ui/splash/splash.dart';

Future main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static int currentSelectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      routes: Routes.routes,
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Raleway'),
      home: SplashScreen(),
    );
  }
}


Routes {
  static final routes = <String, WidgetBuilder>{
    rc.Routes.splash: (BuildContext context) => SplashScreen(),
    rc.Routes.search: (BuildContext context) => HomeScreen(),
    rc.Routes.detail: (BuildContext context) => DetailScreen(),
    rc.Routes.favourites: (BuildContext context) => FavouritesScreen(),
    rc.Routes.downloads: (BuildContext context) => DownloadsScreen(),
    rc.Routes.downloadProgress: (BuildContext context) => DownloadProgressScreen(),
  };
}