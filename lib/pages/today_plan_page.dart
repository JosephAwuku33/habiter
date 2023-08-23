import 'package:flutter/material.dart';
import 'package:habiter/widgets/calendar_widgets.dart';
import 'package:habiter/widgets/habit_block.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 370,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow[600],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: const Text(
                            "✰ Go Premium",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      // Would need to work on stacking widgets
                      const Stack(
                        children: [
                          CircleAvatar(
                              backgroundImage: AssetImage("assets/Joseph.jpg"),
                              radius: 30),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Today",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const DateTimeCalendars(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Color(0xffE5E5E5)),
            child: const Column(
              children: [
                SizedBox(height: 30),
                HabitBlock(habitName: 'Lift Weights'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
