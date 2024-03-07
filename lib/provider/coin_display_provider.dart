import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoinDisplayProvider extends ChangeNotifier {
  int scorePoints = 0;
  static const String _scoreKey = 'scorePoints';

  CoinDisplayProvider() {
    // Initialize the scorePoints from the shared preferences when the class is instantiated
    _loadScorePoints();
  }

  Future<void> _loadScorePoints() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieves the scorePoints from shared preferences, defaulting to 0 if it doesn't exist
    scorePoints = prefs.getInt(_scoreKey) ?? 0;
    notifyListeners();
  }

  Future<void> _saveScorePoints() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_scoreKey, scorePoints);
  }

  void incrementScorePoints(int points) {
    scorePoints += points;
    _saveScorePoints();
    notifyListeners();
  }

  void decrementScorePoints(int points) {
    scorePoints -= points;
    _saveScorePoints();
    notifyListeners();
  }
}
