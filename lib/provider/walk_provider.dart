import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

/// WalkProvider class manages the pedometer functionality of the application.
///
/// This class utilizes ChangeNotifier to notify listeners when the pedometer data changes.
/// Effective Dart: Usage has been followed in structuring this class.
class WalkProvider extends ChangeNotifier {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  String get steps => _steps;
  String get status => _status;

  void onStepCount(StepCount event) {
    _steps = event.steps.toString();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    _status = event.status;
    notifyListeners();
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    _status = 'Pedestrian Status not available';
    notifyListeners();
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    _steps = 'Step Count not available';
    notifyListeners();
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }
}
