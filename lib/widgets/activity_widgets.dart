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
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
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
        ],
      ),
    );
  }

  Widget buildDivider() => const SizedBox(
        height: 10,
        child: VerticalDivider(),
      );
  Widget buildButton(
          BuildContext context, String assetName, VoidCallback onPresssed) =>
      MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            onPresssed();
          },
          child: SvgPicture.asset(assetName));
}
