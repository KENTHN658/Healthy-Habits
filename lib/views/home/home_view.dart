import 'package:flutter/material.dart';

import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:mobiletest3/widgets/cardsleep.dart';
import 'package:mobiletest3/widgets/cardwater.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade200,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              CardWater(),
              sleepCard(),
            ],
          ),
        ),
      ),
    );
  }
}
