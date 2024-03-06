import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class CardSleep extends StatefulWidget {
  @override
  State<CardSleep> createState() => _CardSleepState();
}

class _CardSleepState extends State<CardSleep> {
  DateTime? startTime;
  DateTime? endTime;
  double _progress = 0.0; // Represents sleep progress
  bool timerStarted = false;

  void startTimer() {
    setState(() {
      startTime = DateTime.now();
      endTime = null;
      _progress = 0.0; // Reset progress when starting
      timerStarted = true;
    });
  }

  void stopTimer() {
    if (startTime != null) {
      setState(() {
        endTime = DateTime.now();
        _calculateProgress(); // Update progress based on sleep time
        timerStarted = false;
      });
    } else {
      // Show a message if the user tries to stop the timer without starting it first
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please start the timer first')),
      );
    }
  }

  // Calculate progress for the circular indicator
  void _calculateProgress() {
    if (startTime != null && endTime != null) {
      final duration = endTime!.difference(startTime!).inSeconds;
      // Assuming 8 hours of sleep is ideal
      final goalDuration = 8 * 60 * 60;
      _progress = duration / goalDuration;
      if (_progress > 1.0) _progress = 1.0;
    }
  }

  // Helper Functions for Time Formatting
  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  String _formatTimeDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitHours = twoDigits(duration.inHours);
    return "$twoDigitHours:$twoDigitMinutes";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sleep Times
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'เวลาเข้านอน:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.purpleAccent,
                    ),
                  ),
                  Text(
                    '${startTime != null ? _formatTime(startTime!) : 'ยังไม่ได้เริ่ม'}',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'เวลาที่นอน:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  Text(
                    '${endTime != null ? _formatTimeDuration(endTime!.difference(startTime!)) : 'ยังไม่ได้หยุด'}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),

              // Start/Stop Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      primary: Colors.purpleAccent, // Adjusted primary color
                    ),
                    onPressed: timerStarted ? null : startTimer,
                    child: Text('เริ่มต้นจับเวลา',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      primary: Colors.pinkAccent, // Adjusted primary color
                    ),
                    onPressed: timerStarted ? stopTimer : null,
                    child: Text('หยุดจับเวลา',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Progress Indicator
              SizedBox(
                width: 120,
                height: 120,
                child: LiquidCircularProgressIndicator(
                  value: _progress,
                  center: Text("${(_progress * 100).toInt()}%"),
                  borderColor: Colors.black87,
                  backgroundColor: Colors.transparent,
                  borderWidth: 5.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

