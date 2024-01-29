import 'dart:convert';

import 'package:netflix_clone/core/api.constants.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> getAllMovies() async {
  const movies =
      "https://api.themoviedb.org/3/trending/all/week?api_key=${ApiConstants.key}";
  final response = await http.get(Uri.parse(movies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('Try Again');
  }
}

Future<List<Movie>> getSearchedMovies(String value) async {
  final originals =
      "https://api.themoviedb.org/3/search/movie?api_key=${ApiConstants.key}&query=$value";
  final response = await http.get(Uri.parse(originals));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(jsonData['results']);
    return data.movieList;
  } else {
    throw Exception('try again');
  }
}
