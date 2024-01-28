import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/search/widgets/search_results.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.accents[index % Colors.accents.length],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left side
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: kWhiteColour,
                    size: 30,
                  )),
            ),
            // rightside
            const Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(''),
                ),
              ),
              VideoActionWidget(icon: Icons.emoji_emotions, title: 'Share'),
              VideoActionWidget(icon: Icons.add, title: 'LOL'),
              VideoActionWidget(icon: Icons.share, title: 'My List'),
              VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
            ]),
          ],
        ),
      ),
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(color: kWhiteColour, fontSize: 16),
        )
      ]),
    );
  }
}
