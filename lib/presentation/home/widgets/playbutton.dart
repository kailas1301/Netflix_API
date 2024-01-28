import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          iconSize: const MaterialStatePropertyAll(23),
          backgroundColor: const MaterialStatePropertyAll(kWhiteColour)),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 20,
        color: Colors.black,
      ),
    );
  }
}
