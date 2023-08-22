import 'package:flutter/material.dart';
import 'package:habiter/models/habit.dart';

class HabitProvider with ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get settings => _habits;

  void addHabit(Habit newHabit) {
    _habits.add(newHabit);
    notifyListeners(); // Notify listeners that the habits have changed, so they can update their UI accordingly (e.g., rebuild).
  }
}
