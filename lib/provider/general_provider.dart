import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class GeneralProvider extends ChangeNotifier {
  bool showIcons = false;

  void toggleIcons() {
    showIcons = !showIcons;
    notifyListeners();
  }

  List<int> userScores = [];

  Future<void> getUserScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userScoresString = prefs.getString('user_scores');
    //await prefs.clear();
    if (userScoresString != null) {
      userScores =
          userScoresString.split(',').map((s) => int.tryParse(s) ?? 0).toList();
      notifyListeners();
    }
  }

  List<String> storedTimes = [];
  //List<String> datetimes = [];
  // String? datetime;
  Future<void> loadStoredTimes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTimesList = prefs.getStringList('storedTimes');

    storedTimes = storedTimesList ?? [];

    notifyListeners();
  }
}
