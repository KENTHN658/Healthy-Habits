import 'package:flutter/material.dart';
import 'package:mobiletest3/widgets/cardwalk.dart';
import 'package:mobiletest3/widgets/cardwater.dart';
import 'package:mobiletest3/widgets/cardsleep.dart';
import 'package:provider/provider.dart';
import '../../provider/walk_provider.dart';

/// HomeView is a StatefulWidget representing the home screen of the application.
///
/// This widget initializes the platform state for the walk provider and displays
/// various cards for water, sleep, and walk data.
/// Effective Dart: Usage has been followed in structuring this widget.
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Provider.of<WalkProvider>(context, listen: false).initPlatformState();

    return Scaffold(
      body: Container(
        color: Colors.pink.shade50,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                CardWater(),
                // CardWater(),
                CardSleep(),
                CardWalk(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
