import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitBlock extends StatelessWidget {
  final String habitName;
  const HabitBlock({super.key, required this.habitName});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //progress circle
                CircularPercentIndicator(radius: 25, percent: 0.7),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habitName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "40%",
                      style: TextStyle(color: Colors.blueGrey[900]),
                    )
                  ],
                ),
              ],
            ),
            const Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
