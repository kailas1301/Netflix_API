import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomIconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomIconWithText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        icon,
        color: kWhiteColour,
        size: 25,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      )
    ]);
  }
}
