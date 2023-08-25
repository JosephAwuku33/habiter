import 'package:hive/hive.dart';

part '../../habit_model.g.dart';

@HiveType(typeId: 1)
class Habiter {
  Habiter(
      {required this.habitName,
      required this.habitDetails,
      required this.habitPeriod,
      required this.habitActivity,
      required this.dateTaken});
  @HiveField(0)
  String habitName;

  @HiveField(1)
  String habitDetails;

  @HiveField(2)
  String habitActivity;

  @HiveField(3)
  String habitPeriod;

  @HiveField(4)
  DateTime dateTaken;
}
