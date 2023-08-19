import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/habit_provider.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context, listen: false);
    return GridView.count(
      padding: const EdgeInsets.all(16.0),
      childAspectRatio: 3.5,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              habitProvider.updatePeriod("Morning");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.yellow[500]),
            child: const Text(
              'Morning',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              habitProvider.updatePeriod("Afternoon");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.yellow[500]),
            child: const Text(
              'Afternoon',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              habitProvider.updatePeriod("Evening");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.yellow[500]),
            child: const Text('Evening',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              habitProvider.updatePeriod("Dawn");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.yellow[500]),
            child: const Text('Dawn',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              habitProvider.updatePeriod("Anytime");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.yellow[500]),
            child: const Text('Anytime',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              habitProvider.updatePeriod("Noon");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.yellow[500]),
            child: const Text('Noon',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
