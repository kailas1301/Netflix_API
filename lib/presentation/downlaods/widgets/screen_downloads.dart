import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  final _sectionList = const [_SmarDownloads(), Section2(), Section3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _sectionList[index],
            separatorBuilder: (context, index) => const SizedBox(height: 25),
            itemCount: _sectionList.length));
  }
}

// section 1
class _SmarDownloads extends StatelessWidget {
  const _SmarDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      kWidth,
      Icon(
        Icons.settings,
        color: kWhiteColour,
      ),
      kWidth,
      Text(
        'Smart Downloads',
        style: TextStyle(
            color: kWhiteColour, fontSize: 18, fontWeight: FontWeight.w900),
      )
    ]);
  }
}

// section 2 containing text and images of the movies
class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<String> imageList = [
      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/xxh6CFgwzYW29dSOsRjRBTpfqWT.jpg",
      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/x23Fqkt00uqV2TzfSiB60hrc3HY.jpg",
      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg"
    ];
    return Column(
      children: [
        const Text(
          "Introducing Downloads for You",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColour, fontSize: 22, fontWeight: FontWeight.w900),
        ),
        kHeight,
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "We will download a personalised selection of\nmovies and shows for you ,so there's\nalways something to watch on your\ndevice ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                radius: size.width * 0.4,
              ),
              DownlaodScreenMovieImageWidget(
                radius: 10,
                imageUrl: imageList[0],
                angle: 20,
                margin: const EdgeInsets.only(left: 170, bottom: 30),
                size: Size(size.width * 0.4, size.width * 0.55),
              ),
              DownlaodScreenMovieImageWidget(
                radius: 10,
                imageUrl: imageList[1],
                angle: -20,
                margin: const EdgeInsets.only(right: 170, bottom: 30),
                size: Size(size.width * 0.4, size.width * 0.55),
              ),
              DownlaodScreenMovieImageWidget(
                radius: 10,
                imageUrl: imageList[2],
                angle: 0,
                margin: const EdgeInsets.only(left: 0, top: 10),
                size: Size(size.width * 0.43, size.width * 0.62),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// section 3 containing 2 buttons
class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: kButtoncolourBlue,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Set Up',
                  style: TextStyle(
                      color: kWhiteColour,
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
        kHeight,
        kHeight,
        MaterialButton(
          color: kButtoncolourWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See What You Can Download',
              style: TextStyle(
                  color: kBlackColour,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
        )
      ],
    );
  }
}

// images of the movies
class DownlaodScreenMovieImageWidget extends StatelessWidget {
  const DownlaodScreenMovieImageWidget({
    super.key,
    required this.imageUrl,
    required this.angle,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  final String imageUrl;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 0),
              color: kBlackColour,
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}
