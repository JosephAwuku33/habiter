import 'package:flutter/material.dart';
import 'package:habiter/models/hive_data/habit_model.dart';
import 'package:hive/hive.dart';
import 'package:habiter/misc/enums.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

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

  Future<void> createHabitWithNotification({
    required String habitName,
    required TimePeriod period,
  }) async {
    // Your habit creation logic here

    // Schedule notifications based on scheduledTime
    await _scheduleNotification(habitName, period);
  }

  Future<void> _scheduleNotification(
      String habitName, TimePeriod timePeriod) async {
    int hour = 0;
    int minute = 0;

    switch (timePeriod) {
      case TimePeriod.Morning:
        hour = 7;
        minute = 0;
        break;
      case TimePeriod.Afternoon:
        hour = 15;
        minute = 0;
        break;
      case TimePeriod.Dawn:
        hour = 5;
        minute = 30;
        break;
      case TimePeriod.Dusk:
        hour = 19;
        minute = 0;
        break;
      case TimePeriod.Noon:
        hour = 12;
        minute = 0;
        break;
      case TimePeriod.Evening:
        hour = 18;
        minute = 0;
        break;
    }

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: habitName.hashCode,
        channelKey: 'basic_channel',
        title: 'Reminder',
        body: '$habitName ',
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }
}
