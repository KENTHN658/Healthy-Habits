import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mobiletest3/navigation/app_navigation.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Example',
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigation.router,
    );
  }
}