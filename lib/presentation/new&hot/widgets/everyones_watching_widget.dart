import 'package:flutter/material.dart';
import 'package:netflix_clone/application/new&hot/new&hotfunctions.dart';
import 'package:netflix_clone/core/api.constants.dart';
import 'package:netflix_clone/model/model.dart';
import 'everyones_watching_info_card.dart';

ValueNotifier<List<Movie>> everyonesWatchingNotifier = ValueNotifier([]);

class EveryonesWatchingWidget extends StatefulWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EveryonesWatchingWidget> createState() =>
      _EveryonesWatchingWidgetState();
}

class _EveryonesWatchingWidgetState extends State<EveryonesWatchingWidget> {
  @override
  void initState() {
    fetchmovies();
    super.initState();
  }

  void fetchmovies() async {
    everyonesWatchingNotifier.value = await getEveryOnesWatchingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: everyonesWatchingNotifier,
      builder: (context, snapshot, _) {
        if (snapshot.isEmpty) {
          return const Text('data not found');
        } else if (snapshot.isNotEmpty) {
          return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final movie = snapshot[index];
                    final image =
                        ApiConstants.imageBaseUrl + (movie.backDropPath ?? '');
                    return EveryonesWatchingInfoCard(
                        imageUrl: image,
                        overview: movie.overview ?? '',
                        title: movie.orginaltitle ?? '');
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 30,
                      ),
                  itemCount: snapshot.length));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
