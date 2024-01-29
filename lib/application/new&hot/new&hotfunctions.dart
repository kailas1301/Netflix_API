import 'dart:convert';
import 'package:netflix_clone/application/movies/movies_functions.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> getComingSoonMovies() async {
  final response = await http.get(Uri.parse(upcomingMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('try again');
  }
}

Future<List<Movie>> getEveryOnesWatchingMovies() async {
  final response = await http.get(Uri.parse(trendingMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('Try Again');
  }
}
