import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/application/movies/movies_functions.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/home/widgets/playbutton.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> horrorMovies;
  late Future<List<Movie>> comedyMovies;
  late Future<List<Movie>> actionMovies;
  late Future<List<Movie>> upComingMovies;

  @override
  void initState() {
    trendingMovies = getTrendingMovies();
    horrorMovies = getHorrorMovies();
    comedyMovies = getComedyMovies();
    actionMovies = getActionMovies();
    upComingMovies = getUpComingMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext, context, index) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    Column(
                      children: [
                        const HomeBackgroundCard(),
                        MainTitleCard(
                          movies: trendingMovies,
                          title: "Trending Movies",
                        ),
                        kHeight,
                        MainTitleCard(
                          movies: horrorMovies,
                          title: 'Horror Movies',
                        ),
                        kHeight,
                        NumberTitleCard(movies: upComingMovies),
                        kHeight,
                        MainTitleCard(
                          movies: comedyMovies,
                          title: 'Comedy Movies',
                        ),
                        kHeight,
                        MainTitleCard(
                          movies: actionMovies,
                          title: 'Action films',
                        )
                      ],
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 6000),
                        width: double.infinity,
                        height: 120,
                        color: Colors.black.withOpacity(0.05),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Image(
                                    image: AssetImage('assets/images/logo.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    'assets/images/profile.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                kHeight,
                              ],
                            ),
                            kHeight,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: textStyle,
                                ),
                                Text(
                                  "Movies",
                                  style: textStyle,
                                ),
                                Text(
                                  'Categories',
                                  style: textStyle,
                                )
                              ],
                            )
                          ],
                        ))
                    : kHeight
              ],
            ),
          );
        },
      ),
    ));
  }
}

class HomeBackgroundCard extends StatelessWidget {
  const HomeBackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(kMainImage))),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconWithText(icon: Icons.add, text: 'My List '),
                PlayButton(),
                CustomIconWithText(icon: Icons.info_outline, text: 'Info'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
