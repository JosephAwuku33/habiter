import 'package:flutter/material.dart';
//import 'package:habiter/models/habit.dart';
import 'package:habiter/models/hive_data/habit_model.dart';
import 'package:hive/hive.dart';

/*
class HabitProvider with ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get settings => _habits;

  void addHabit(Habit newHabit) {
    _habits.add(newHabit);
    notifyListeners(); // Notify listeners that the habits have changed, so they can update their UI accordingly (e.g., rebuild).
  }
}
*/

class HabitProvider extends ChangeNotifier {
  late Box<Habiter> _habits;

  HabitProvider() {
    _habits = Hive.box<Habiter>('habitsBox');
  }

  List<Habiter> get habits => _habits.values.toList();

  void addHabit(Habiter habiter) {
    _habits.add(habiter);
    notifyListeners();
  }

  void deleteHabit(int index) {
    _habits.deleteAt(index);
    notifyListeners();
  }
}
