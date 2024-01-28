import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      kWidth,
      Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      ),
      const Spacer(),
      const Icon(
        Icons.cast,
        color: Colors.white,
      ),
      kWidth,
      Container(
        width: 30,
        height: 30,
        child: Image.asset(
          'assets/images/profile.png',
          fit: BoxFit.cover,
        ),
      ),
      kWidth,
    ]);
  }
}
