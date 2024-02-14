import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
class WalkView extends StatefulWidget {
  const WalkView({super.key});

  @override
  State<WalkView> createState() => _WalkViewState();
}

class _WalkViewState extends State<WalkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.directions_walk,
              color: Colors.indigoAccent,
              size: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Walk",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 12,
            ),
            WaterClickAnimation(),
            MaterialButton(
              color: Colors.indigoAccent,
              onPressed: () {
                context.goNamed("subSetting");
              },
              child: const Text(
                "Navigate To Sub Walk View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
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
              width: 200,
              height: 200,
              child: LiquidCircularProgressIndicator(
                value: _progress, // Use the progress value to determine the water level
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