import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class SleepCard extends StatefulWidget {
  const SleepCard({Key? key});

  @override
  State<SleepCard> createState() => _SleepCardState();
}

class _SleepCardState extends State<SleepCard> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
