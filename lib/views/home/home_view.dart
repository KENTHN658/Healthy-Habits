import 'package:flutter/material.dart';
import 'package:mobiletest3/widgets/cardwalk.dart';
import 'package:mobiletest3/widgets/cardwater.dart';
import 'package:mobiletest3/widgets/cardsleep.dart';
import 'package:provider/provider.dart';

import '../../provider/walk_provider.dart';


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
        color: Colors.green.shade200,
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