import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
as picker;

class CardSleep extends StatefulWidget {
  @override
  State<CardSleep> createState() => _CardSleepState();
}

class _CardSleepState extends State<CardSleep> {
  DateTime? selectedTime;

  void _showTimePicker() {
    picker.DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      onConfirm: (time) {
        setState(() {
          selectedTime = time;
        });
      },
      currentTime: DateTime.now(),
    );
  }
  DateTime? startTime;
  DateTime? endTime;

  void startTimer() {
    setState(() {
      startTime = DateTime.now();
      endTime = null;
    });
  }

  void stopTimer() {
    setState(() {
      endTime = DateTime.now();
    });
  }
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
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'เวลาเข้านอน: ${startTime != null ? startTime!.toString() : 'ยังไม่ได้เริ่ม'}',
                    ),
                    Text(
                      'เวลาที่นอน: ${endTime != null ? endTime!.difference(startTime!).toString() : 'ยังไม่ได้หยุด'}',
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: startTimer,
                      child: Text('เริ่มต้นจับเวลา'),
                    ),
                    ElevatedButton(
                      onPressed: stopTimer,
                      child: Text('หยุดจับเวลา'),
                    ),
                  ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: Colors.red,
                  )
                ],
              )
            ],

          ),
        ),
      ),
    );
  }
}
