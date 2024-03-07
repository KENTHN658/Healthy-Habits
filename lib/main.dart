import 'package:flutter/material.dart';
import 'package:mobiletest3/navigation/app_navigation.dart';
import 'package:mobiletest3/provider/coin_display_provider.dart';
import 'package:mobiletest3/provider/walk_provider.dart';
import 'package:mobiletest3/theme/theme.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CoinDisplayProvider()),
        ChangeNotifierProvider(create: (context) => WalkProvider()),
      ],
      child: MaterialApp.router(
        title: 'Go Router Example',
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigation.router,
        theme: buildTheme(),
      ),
    );
  }
}
