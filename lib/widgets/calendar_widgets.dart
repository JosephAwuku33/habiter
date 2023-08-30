// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class DateTimeCalendars extends StatefulWidget {
  const DateTimeCalendars({super.key});

  @override
  State<DateTimeCalendars> createState() => _DateTimeCalendarsState();
}

class _DateTimeCalendarsState extends State<DateTimeCalendars> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CalendarTimeline(
          showYears: true,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
          onDateSelected: (date) => setState(() => _selectedDate = date),
          monthColor: Colors.white70,
          dayColor: Colors.teal[200],
          dayNameColor: const Color(0xFF333A47),
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.deepPurpleAccent[300],
          dotsColor: const Color(0xFF333A47),
          //selectableDayPredicate: (date) => date.day != 22,
          locale: 'en',
        ),
      ],
    );
  }
}
