import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final String selectedTimePeriod;
  final ValueChanged<String> onTimePeriodSelected;
  const MyGridView(
      {super.key,
      required this.selectedTimePeriod,
      required this.onTimePeriodSelected});

  @override
  Widget build(BuildContext context) {
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
              onTimePeriodSelected('Morning');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: selectedTimePeriod == 'Morning'
                    ? Colors.green
                    : Colors.white),
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
              onTimePeriodSelected('Afternoon');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: selectedTimePeriod == 'Afternoon'
                    ? Colors.green
                    : Colors.white),
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
              onTimePeriodSelected('Evening');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: selectedTimePeriod == 'Evening'
                    ? Colors.green
                    : Colors.white),
            child: const Text('Evening',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              onTimePeriodSelected('Dawn');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedTimePeriod == 'Dawn' ? Colors.green : Colors.white),
            child: const Text('Dawn',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              onTimePeriodSelected('Anytime');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: selectedTimePeriod == 'Anytime'
                    ? Colors.green
                    : Colors.white),
            child: const Text('Anytime',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              onTimePeriodSelected('Noon');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedTimePeriod == 'Noon' ? Colors.green : Colors.white),
            child: const Text('Noon',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
