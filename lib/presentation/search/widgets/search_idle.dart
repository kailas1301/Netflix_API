import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/api.constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  final Future<List<dynamic>> movies;
  const SearchIdleWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SearchTitle(title: 'Top Searches'),
      kHeight,
      FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('error is :${snapshot.error}');
          } else if (snapshot.hasData) {
            return Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    final image =
                        ApiConstants.imageBaseUrl + (movie.backDropPath ?? '');
                    final titleOfMovie = movie.orginaltitle ?? '';
                    print(image);
                    print(titleOfMovie);

                    return TopSearchMovieTile(
                        imageUrl: image, title: titleOfMovie);
                  },
                  separatorBuilder: (context, index) => kHeight20,
                  itemCount: snapshot.data!.length),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    ]);
  }
}

class TopSearchMovieTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  const TopSearchMovieTile(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        kWidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: kWhiteColour, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kWhiteColour,
          radius: 20,
          child: CircleAvatar(
            backgroundColor: kBlackColour,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhiteColour,
            ),
          ),
        )
      ],
    );
  }
}
