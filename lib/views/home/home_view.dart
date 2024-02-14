import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home,
                color: Colors.red,
                size: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Home",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 12,
              ),
              CardExample(),
              MaterialButton(
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.pushNamed(context, "subHome");
                },
                child: const Text(
                  "Navigate To Sub Home View",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardExample extends StatefulWidget {
  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 250;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.water_drop),
                        ),
                        TextSpan(
                          text: '$_counter',
                          style: TextStyle(
                            color: Colors.black, // Change the color of _counter
                            fontWeight: FontWeight.bold, // Make _counter bold
                            fontSize: 25, // Increase the font size of _counter
                          ),
                        ),
                        TextSpan(
                          text: ' /2000 มิลลิลิตร',
                          style: TextStyle(
                            color: Colors.grey, // Color of "/2000 มิลลิลิตร"
                            fontSize: 15, // Font size of "/2000 มิลลิลิตร"
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      child: const Text('+ 250 มิลิลิตร'),
                      onPressed: () {
                        _incrementCounter();
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              WaterClickAnimation(), // รูปดาวที่เพิ่มเข้ามา
            ],
          ),
        ),
      ),
    );
  }
}

class WaterClickAnimation extends StatefulWidget {
  @override
  _WaterClickAnimationState createState() => _WaterClickAnimationState();
}

class _WaterClickAnimationState extends State<WaterClickAnimation> {
  double _progress = 0.0;

  void _updateProgress() {
    setState(() {
      _progress += 0.1; // Increase progress when clicked
      if (_progress > 1.0) {
        _progress = 1.0; // Set progress to 1.0 when it exceeds 1.0
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _updateProgress,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: LiquidCircularProgressIndicator(
                value:
                    _progress, // Use the progress value to determine the water level
                borderColor: Colors.blueAccent,
                borderWidth: 5.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                center: Text(
                  "${(_progress * 100).toStringAsFixed(0)}%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                direction: Axis.vertical,
              ),
            ),
            Text(
              'Tap to Add Water',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
