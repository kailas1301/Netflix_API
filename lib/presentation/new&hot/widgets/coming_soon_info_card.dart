import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';

class ComingSoonInfoCard extends StatelessWidget {
  const ComingSoonInfoCard({
    super.key,
    // required this.movieInfo
  });

  // final MovieInfoModel movieInfo;

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    // 'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';

    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '12/10/2018'
                  // fetchDate(movieInfo.releaseDate!)
                  ,
                  style: TextStyle(
                      fontSize: 18,
                      color: kWhiteColour,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(videoImage: imageUrl),
                kHeight,
                const Row(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        CustomIconWithText(
                          icon: Icons.alarm_rounded,
                          text: 'Remind me',
                        ),
                        kWidth,
                        CustomIconWithText(
                          icon: Icons.info_outline,
                          text: 'Info',
                        ),
                        kWidth,
                      ],
                    )
                  ],
                ),
                kHeight,
                // Text("Coming on ${fetchDay(movieInfo.releaseDate!)}"),
                kHeight,
                const Text(
                  // movieInfo.originalTitle ?? 'Empty Title',
                  'movie',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                kHeight,
                const Text(
                  // movieInfo.overview,
                  'good',
                  style: TextStyle(color: Colors.grey),
                ),
                kHeight20
              ],
            ),
          ),
        ],
      ),
    );
  }

  String fetchDate(String date) {
    //convert date in string format to date format
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");
    //add \n to make it in the displayable format eg:
    //APR
    //5
    return "${formatDate.first.substring(0, 3)} \n${formatDate.last} ";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}
