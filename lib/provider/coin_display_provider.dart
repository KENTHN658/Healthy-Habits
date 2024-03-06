
import 'package:flutter/material.dart';

class CoinDisplayProvider extends ChangeNotifier {
  int scorePoints = 0;

  void incrementScorePoints(int points) {
    scorePoints += points;
    notifyListeners();
  }
}