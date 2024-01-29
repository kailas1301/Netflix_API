import 'package:flutter/material.dart';
import 'package:netflix_clone/core/api.constants.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Movies & TV'),
        kHeight,
        ValueListenableBuilder(
          valueListenable: searchNotifier,
          builder: (context, snapshot, _) {
            if (snapshot.isEmpty) {
              return const Text('Is Empty');
            } else if (snapshot.isNotEmpty) {
              return Expanded(
                  child: Expanded(
                      child: GridView.builder(
                itemCount: snapshot.length,
                itemBuilder: (context, index) {
                  final movies = snapshot[index];
                  final imageUrl =
                      ApiConstants.imageBaseUrl + (movies.posterPath ?? '');
                  return MainMovieCard(imageUrl: imageUrl);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.4,
                ),
              )));
            } else {
              return const CircularProgressIndicator();
            }
          },
        )
      ],
    );
  }
}

class MainMovieCard extends StatelessWidget {
  final String imageUrl;
  const MainMovieCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
