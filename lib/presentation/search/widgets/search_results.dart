import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({super.key, required this.searchedmovieList});
  final Future<List<Movie>> searchedmovieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Movies & TV'),
        kHeight,
        FutureBuilder(
          future: searchedmovieList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('error ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Expanded(
                  child: Expanded(
                      child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                children: List.generate(snapshot.data!.length, (index) {
                  final movie = snapshot.data![index];
                  final image = movie.posterPath ?? "";
                  return MainMovieCard(imageUrl: image);
                }),
              )));
            } else {
              return CircularProgressIndicator();
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
