import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';
import '../provider/coin_display_provider.dart';

class CardWater extends StatefulWidget {
  @override
  State<CardWater> createState() => _CardWaterState();
}

/// State class for the CardWater widget
class _CardWaterState extends State<CardWater> {
  int _counter = 0; // Counter to track the amount of water
  double _progress = 0.0; // Progress to represent the water level

  // Method to increment the water counter and update the score points
  void _incrementCounter(CoinDisplayProvider coin) {
    setState(() {
      _counter = _counter + 250; // Increment the water counter by 250 ml
      coin.incrementScorePoints(10); // Increment score points
      setState(() {}); // Update UI
    });
  }

  // Method to update the progress when water is added
  void _updateProgress(CoinDisplayProvider coin) {
    setState(() {
      coin.incrementScorePoints(10); // Increment score points
      _progress += 0.125; // Increase progress when clicked
      if (_progress > 1.0) {
        _progress = 1.0; // Set progress to 1.0 when it exceeds 1.0
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final coin = Provider.of<CoinDisplayProvider>(context); // Access coin provider

    // Return the main widget structure
    return Center(
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display the water counter
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 25, // Increase the font size of _counter
                          fontWeight: FontWeight.bold, // Make _counter bold
                          color: Colors.black, // Change the color of _counter
                        ),
                        children: [
                          // Water drop icon
                          WidgetSpan(
                            child: Icon(Icons.water_drop, color: Colors.lightBlue[400]), // Adjusted water drop icon color
                          ),
                          // Display the water counter
                          TextSpan(
                            text: '$_counter',
                          ),
                          // Display the total target volume
                          TextSpan(
                            text: ' /2000 มิลลิลิตร',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontSize: 15,
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10), // Add some space between the text and the button
                    // Button to add 250 ml of water
                    TextButton(
                      child: const Text('+ 250 มิลลิลิตร'),
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
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display the water level progress indicator
                    GestureDetector(
                      child: Container(
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
                              color: Colors.grey.shade900, // Adjusted percentage text color
                            ),
                          ),
                          direction: Axis.vertical,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
