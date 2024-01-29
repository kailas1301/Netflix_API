import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  final String imageurl;

  const VideoListItem({super.key, required this.index, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageurl), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageurl),
                ),
              ),
              const VideoActionWidget(
                  icon: Icons.emoji_emotions, title: 'Share'),
              const VideoActionWidget(icon: Icons.add, title: 'LOL'),
              const VideoActionWidget(icon: Icons.share, title: 'My List'),
              const VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
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
