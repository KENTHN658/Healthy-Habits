///ผู้จัดทำ
///640510657 ธนโชติ วัฒนชูสกุล
///640510658 ธนธรณ์ บุญเชิด
///640510666 ปราริศา สุระวัง

import 'package:flutter/material.dart';
import 'package:mobiletest3/navigation/app_navigation.dart';
import 'package:mobiletest3/provider/coin_display_provider.dart';
import 'package:mobiletest3/provider/walk_provider.dart';
import 'package:mobiletest3/theme/theme.dart';
import 'package:provider/provider.dart';

/// Entry point of the application.
void main() {
  // Ensure that all necessary bindings are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Run the application.
  runApp(const MyApp());
}

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provide the CoinDisplayProvider for managing coin display state.
        ChangeNotifierProvider(create: (context) => CoinDisplayProvider()),

        // Provide the WalkProvider for managing walk-related state.
        ChangeNotifierProvider(create: (context) => WalkProvider()),
      ],
      child: MaterialApp.router(
        // Set the title of the application.
        title: 'Go Router Example',

        // Disable the debug banner in release mode.
        debugShowCheckedModeBanner: false,

        // Configure the router for navigation using GoRouter.
        routerConfig: AppNavigation.router,

        // Apply the custom theme to the app.
        theme: buildTheme(),
      ),
    );
  }
}
