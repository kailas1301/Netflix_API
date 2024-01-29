import 'package:flutter/material.dart';
import 'package:netflix_clone/application/new&hot/new&hotfunctions.dart';
import 'package:netflix_clone/core/api.constants.dart';
import 'package:netflix_clone/model/model.dart';
import 'coming_soon_info_card.dart';

ValueNotifier<List<Movie>> comingSoonMovieNotifier = ValueNotifier([]);

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  @override
  void initState() {
    fetchmovies();
    super.initState();
  }

  void fetchmovies() async {
    comingSoonMovieNotifier.value = await getComingSoonMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: comingSoonMovieNotifier,
      builder: (context, snapshot, _) {
        if (snapshot.isEmpty) {
          return (const Text('error'));
        } else if (snapshot.isNotEmpty) {
          return Expanded(
              child: ListView.separated(
            itemCount: snapshot.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) {
              final movie = snapshot[index];
              final imageurl =
                  ApiConstants.imageBaseUrl + (movie.backDropPath ?? '');
              final releaseDate = movie.releaseData ?? '';
              final overview = movie.overview ?? '';
              final orignalTitle = movie.orginaltitle ?? '';
              return ComingSoonInfoCard(
                  releaseDate: releaseDate,
                  originalTitle: orignalTitle,
                  overview: overview,
                  imageUrl: imageurl);
            },
          ));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
