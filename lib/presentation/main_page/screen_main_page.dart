import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downlaods/widgets/screen_downloads.dart';
import 'package:netflix_clone/presentation/fastLaugh/screen_fast_laugh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/new&hot/screen_newandhot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({super.key});

  final pages = const [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavWiget(),
    );
  }
}
