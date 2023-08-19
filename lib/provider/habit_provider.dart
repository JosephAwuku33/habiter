import 'package:flutter/material.dart';
import 'package:habiter/models/habit.dart';

class HabitProvider extends ChangeNotifier {
  Habit _habitSettings = Habit(
    title: '',
    details: '',
    activity: '',
    period: '',
  );

  Habit get settings => _habitSettings;

  void updateSettings(Habit newSettings) {
    _habitSettings = newSettings;
    notifyListeners();
  }

  void updateTitle(String newTitle) {
    _habitSettings.setTitle(newTitle);
    notifyListeners();
  }

  void updateDetails(String newDetails) {
    _habitSettings.setDetails(newDetails);
    notifyListeners();
  }

  void updateActivity(String newActivity) {
    _habitSettings.setActivity(newActivity);
    notifyListeners();
  }

  void updatePeriod(String newPeriod) {
    _habitSettings.setPeriod(newPeriod);
    notifyListeners();
  }
}
