import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class CardWater extends StatefulWidget {
  @override
  State<CardWater> createState() => _CardWaterState();
}

class _CardWaterState extends State<CardWater> {
  int _counter = 0;
  double _progress = 0.0;
  void _incrementCounter() {
    setState(() {
      _counter = _counter + 250;
    });
  }

  void _updateProgress() {
    setState(() {
      _progress += 0.125; // Increase progress when clicked
      if (_progress > 1.0) {
        _progress = 1.0; // Set progress to 1.0 when it exceeds 1.0
      }
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
                  TextButton(
                    child: const Text('+ 250 มิลิลิตร'),
                    onPressed: () {
                      _incrementCounter();
                      _updateProgress();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blueAccent),
                            center: Text(
                              "${(_progress * 100).toStringAsFixed(0)}%",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            direction: Axis.vertical,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
