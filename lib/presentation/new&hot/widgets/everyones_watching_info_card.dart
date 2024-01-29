import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWatchingInfoCard extends StatelessWidget {
  const EveryonesWatchingInfoCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.overview,
  });
  final String title;
  final String imageUrl;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoWidget(
            videoImage: imageUrl,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomIconWithText(
                  icon: Icons.share,
                  text: 'Share',
                ),
                kWidth,
                CustomIconWithText(
                  icon: Icons.add,
                  text: 'My List',
                ),
                kWidth,
                CustomIconWithText(
                  icon: Icons.play_arrow,
                  text: "Play",
                ),
                kWidth,
              ],
            ),
          ),
          kHeight,
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            overview,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
