import 'package:habiter/app.dart';
import 'package:flutter/material.dart';
import 'package:habiter/habit_box.dart';
import 'package:habiter/models/hive_data/habit_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> main() async {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests'),
      ],
      debug: true);
  await Hive.initFlutter();
  Hive.registerAdapter(HabiterAdapter());
  habitBox = await Hive.openBox<Habiter>('habitsBox');
  runApp(const MainApp());
}
