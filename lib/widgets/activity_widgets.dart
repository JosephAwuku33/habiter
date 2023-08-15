import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityWidgets extends StatelessWidget {
  const ActivityWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildButton(context, 'assets/activity_icons/run.svg', () {}),
          buildDivider(),
          buildButton(context, 'assets/activity_icons/w.svg', () {}),
          buildDivider(),
          buildButton(context, 'assets/activity_icons/walk.svg', () {}),
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
