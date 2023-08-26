import 'package:habiter/app.dart';
import 'package:flutter/material.dart';
import 'package:habiter/habit_box.dart';
import 'package:habiter/models/hive_data/habit_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HabiterAdapter());
  habitBox = await Hive.openBox<Habiter>('habitsBox');
  runApp(const MainApp());
}
