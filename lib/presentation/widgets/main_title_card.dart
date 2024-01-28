import 'package:flutter/material.dart';
import 'package:netflix_clone/core/api.constants.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final Future<List<dynamic>> movies;

  const MainTitleCard({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: MainTitle(title: title),
        ),
        FutureBuilder(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    snapshot.data!.length,
                    (index) {
                      final movie = snapshot.data![index];

                      // Use null-aware operator to handle null posterPath
                      final imageUrl =
                          ApiConstants.imageBaseUrl + (movie.posterPath ?? '');

                      // Print the constructed image URL for debugging
                      print('Image URL is : $imageUrl');

                      return MainCard(
                        image: imageUrl,
                      );
                    },
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        kHeight,
      ],
    );
  }
}
