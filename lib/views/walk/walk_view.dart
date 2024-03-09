import 'package:flutter/material.dart';
import 'package:mobiletest3/provider/walk_provider.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';

/// WalkView is a StatefulWidget representing the view for tracking walking activity.
///
/// This widget displays the number of steps taken and the pedestrian status (walking, stopped, etc.).
/// Effective Dart: Usage has been followed in structuring this widget.
class WalkView extends StatefulWidget {
  const WalkView({super.key});

  @override
  State<WalkView> createState() => _WalkViewState();
}

class _WalkViewState extends State<WalkView> {
  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    final WalkProvider _walkProvider = Provider.of<WalkProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Steps Taken',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              _walkProvider.steps,
              style: TextStyle(fontSize: 45),
            ),
            Divider(
              height: 100,
              thickness: 0,
              color: Colors.white,
            ),
            Text(
              'Pedestrian Status',
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              _walkProvider.status == 'walking'
                  ? Icons.directions_walk
                  : _walkProvider.status == 'stopped'
                  ? Icons.accessibility_new
                  : Icons.error,
              size: 100,
            ),
            Center(
              child: Text(
                _walkProvider.status,
                style: _walkProvider.status == 'walking' || _walkProvider.status == 'stopped'
                    ? TextStyle(fontSize: 30)
                    : TextStyle(fontSize: 20, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
