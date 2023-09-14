import 'package:flutter/material.dart';
import 'package:habiter/provider/habit_provider.dart';
//import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HabitBlock extends StatelessWidget {
  final String habitName;
  final int id;
  const HabitBlock({super.key, required this.habitName, required this.id});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xff7F4FFF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //progress circle
                //CircularPercentIndicator(radius: 25, percent: 0.7),
                Text(id.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.white)),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habitName,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      habitProvider.habits[id].habitDetails,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.white,
              onPressed: () {
                habitProvider.deleteHabit(id.toInt());
              },
            ),
          ],
        ),
      ),
    );
  }
}
