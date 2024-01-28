import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWatchingInfoCard extends StatelessWidget {
  const EveryonesWatchingInfoCard({
    super.key,
    // required this.movieInfo
  });
  // final MovieInfoModel movieInfo;

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    // 'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //IMAGE,
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
            // movieInfo.originalTitle ??
            'No Title Found',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            'good',
            // movieInfo.overview,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
