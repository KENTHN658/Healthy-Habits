import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mobiletest3/provider/walk_provider.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';
class WalkView extends StatefulWidget {
  const WalkView({super.key});
  @override
  State<WalkView> createState() => _WalkViewState();
}

class _WalkViewState extends State<WalkView> {

  // String _status = '?', _steps = '?';

  // late final WalkProvider _walkProvider;

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // void onStepCount(StepCount event) {
  //   print(event.steps.toString());
  //   final WalkProvider _walkProvider = Provider.of<WalkProvider>(context, listen: false);
  //   _walkProvider.setSteps(event.steps.toString());
  // }

  @override
  Widget build(BuildContext context) {
    final WalkProvider _walkProvider = Provider.of<WalkProvider>(context);
    return
      Scaffold(
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
                style: TextStyle(fontSize: 60),
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

