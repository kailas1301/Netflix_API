import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';
import '../../../core/colors/colors.dart';

class ComingSoonInfoCard extends StatelessWidget {
  const ComingSoonInfoCard({
    super.key,
    required this.releaseDate,
    required this.originalTitle,
    required this.overview,
    required this.imageUrl,
  });

  final String releaseDate;
  final String originalTitle;
  final String overview;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fetchDate(releaseDate),
                  style: const TextStyle(
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
                Text("Coming on ${fetchDay(releaseDate)}"),
                kHeight,
                Text(
                  originalTitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                kHeight,
                Text(
                  overview,
                  style: const TextStyle(color: Colors.grey),
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
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");
    return "${formatDate.first.substring(0, 3)} \n${formatDate.last} ";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}
