import 'package:flutter/material.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Theme_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/routes_Manager.dart';

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  MyApp._internal();
  static final MyApp _instance = MyApp._internal();
  // Singleton MyApp instance..
  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeManager.getroute, // M4 Fahmha
      initialRoute: routes.splashRoute,
      theme: GetApplicationTheme(),
    );
  }
}
