import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberMovieCard extends StatelessWidget {
  const NumberMovieCard({super.key, required this.index, required this.image});
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: kradius10,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image))),
            ),
          ],
        ),
        Positioned(
          left: 15,
          bottom: -20,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: Colors.white,
            child: Text(
              '$index',
              style: GoogleFonts.poppins(
                  fontSize: 120,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
        )
      ],
    );
  }
}
