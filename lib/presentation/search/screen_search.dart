import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/search/search_functions.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_results.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final TextEditingController searchController = TextEditingController();
  late Future<List<Movie>> topSearches;
  bool isSearched = false;
  late Future<List<Movie>> searchmovielist;

  @override
  void initState() {
    topSearches = getAllMovies();
    if (searchController.text.isEmpty) {
      setState(() {
        isSearched = false;
      });
    }
    print('the top search list is$topSearches');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CupertinoTextField(
              controller: searchController,
              onTap: () {
                setState(() {
                  isSearched = true;
                  searchmovielist = getSearchedMovies(searchController.text);
                });
              },
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.withOpacity(0.4),
              ),
              prefix: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffix: const Icon(CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey),
              style: const TextStyle(color: Colors.white),
            ),
            kHeight,
            isSearched == false
                ? Expanded(
                    child: SearchIdleWidget(
                      movies: topSearches,
                    ),
                  )
                : Expanded(
                    child: SearchResultWidget(
                      searchedmovieList: searchmovielist,
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
