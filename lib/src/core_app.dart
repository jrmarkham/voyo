

import 'package:flutter/material.dart';
import 'package:voyo_app/src/ui/screens/gallery.dart';
import 'package:voyo_app/src/ui/screens/home.dart';

class CoreApp extends StatefulWidget {
  @override
  _CoreAppState createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      navigatorKey: navigatorKey,
      routes: {
        '/home': (context) => Home(),
        '/gallery': (context) => Gallery(),
      });
  }

}