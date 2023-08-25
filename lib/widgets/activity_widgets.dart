import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityWidgets extends StatelessWidget {
  final String selectedActivity;
  final ValueChanged<String> onSelectedActivity;
  const ActivityWidgets(
      {super.key,
      required this.onSelectedActivity,
      required this.selectedActivity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildButton(context, 'assets/activity_icons/run.svg', () {
          onSelectedActivity('Running');
        }),
        buildDivider(),
        buildButton(context, 'assets/activity_icons/w.svg', () {
          onSelectedActivity('Hydration');
        }),
        buildDivider(),
        buildButton(context, 'assets/activity_icons/walk.svg', () {
          onSelectedActivity('Walking');
        }),
        buildDivider(),
        buildButton(context, 'assets/activity_icons/run.svg', () {
          onSelectedActivity('Cycling');
        }),
      ],
    );
  }

  Widget buildDivider() => const SizedBox(
        height: 30,
        child: VerticalDivider(),
      );
  Widget buildButton(
          BuildContext context, String assetName, VoidCallback onPresssed) =>
      Padding(
        padding: const EdgeInsets.all(7.0),
        child: GestureDetector(
          onTap: () {
            onPresssed();
          },
          child: SvgPicture.asset(
            assetName,
          ),
        ),
      );
}
