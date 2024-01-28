import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: kradius10,
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
      ),
    );
  }
}
