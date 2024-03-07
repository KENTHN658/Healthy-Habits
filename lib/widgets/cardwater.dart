import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:mobiletest3/widgets/coindisplay.dart';
import 'package:provider/provider.dart';

import '../provider/coin_display_provider.dart';

class CardWater extends StatefulWidget {
  @override
  State<CardWater> createState() => _CardWaterState();
}

class _CardWaterState extends State<CardWater> {
  int _counter = 0;
  double _progress = 0.0;

  void _incrementCounter(CoinDisplayProvider coin) {
    setState(() {
      _counter = _counter + 250;
      coin.incrementScorePoints(10);
      CoinDisplay();
      setState(() {});
    });
  }

  void _updateProgress(CoinDisplayProvider coin) {
    setState(() {
      coin.incrementScorePoints(10);
      _progress += 0.125; // Increase progress when clicked
      if (_progress > 1.0) {
        _progress = 1.0; // Set progress to 1.0 when it exceeds 1.0


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final coin = Provider.of<CoinDisplayProvider>(context);

    return Center(
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 25, // Increase the font size of _counter
                        fontWeight: FontWeight.bold, // Make _counter bold
                        color: Colors.black, // Change the color of _counter
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.water_drop, color: Colors.lightBlue[400]), // Adjusted water drop icon color
                        ),
                        TextSpan(
                          text: '$_counter',
                        ),
                        TextSpan(
                          text: ' /2000 มิลลิลิตร',
                          style: TextStyle(
                            fontSize: 15, // Font size of "/2000 มิลลิลิตร"
                            color: Colors.grey, // Color of "/2000 มิลลิลิตร"
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    child: const Text('+ 250 มิลิลิตร'),
                    onPressed: () {
                      _incrementCounter(coin);
                      _updateProgress(coin);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
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
                            value: _progress, // Use the progress value to determine the water level
                            borderColor: Colors.lightBlue[400], // Adjusted border color
                            borderWidth: 5.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.lightBlue.shade400), // Adjusted progress color
                            center: Text(
                              "${(_progress * 100).toStringAsFixed(0)}%",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Adjusted percentage text color
                              ),
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
