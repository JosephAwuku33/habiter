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
        hour = 13;
        minute = 12;
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
        body: 'It\'s time for your habit: $habitName ',
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




  /*
  Future<void> scheduleNotification(TimePeriod period, context) async {
    TimeOfDay intervalTime;
    String notificationTitle = 'Habit Reminder';
    String notificationBody = 'Remember to complete your habit!';

    switch (period) {
      case TimePeriod.Morning:
        intervalTime = const TimeOfDay(hour: 8, minute: 0);
        break;
      case TimePeriod.Noon:
        intervalTime = const TimeOfDay(hour: 12, minute: 0);
        break;
      case TimePeriod.Afternoon:
        intervalTime = const TimeOfDay(hour: 15, minute: 0);
        break;
      case TimePeriod.Evening:
        intervalTime = const TimeOfDay(hour: 18, minute: 0);
        break;
      case TimePeriod.Dawn:
        intervalTime = const TimeOfDay(hour: 5, minute: 0);
        break;
      case TimePeriod.Dusk:
        intervalTime = const TimeOfDay(hour: 19, minute: 0);
        break;
    }

    DateTime now = DateTime.now();
    DateTime scheduledTime = DateTime(
        now.year, now.month, now.day, intervalTime.hour, intervalTime.minute);

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    if (scheduledTime.hour == intervalTime.hour) {
      ElegantNotification(
        title: Text(notificationTitle),
        description: Text(notificationBody),
        icon: const Icon(
          Icons.notification_important,
          color: Colors.orange,
        ),
        progressIndicatorColor: Colors.orange,
      ).show(context);
    }
  }

  */

