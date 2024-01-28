import 'dart:convert';
import 'package:netflix_clone/core/api.constants.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:http/http.dart' as http;

String originals =
    "${ApiConstants.kBaseUrl}/discover/movie?api_key=${ApiConstants.key}";

String trendingMovies =
    "https://api.themoviedb.org/3/trending/all/week?api_key=${ApiConstants.key}";

Future<List<Movie>> getAllMovies() async {
  final response = await http.get(Uri.parse(originals));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    print('the data of all movies is $data.movieList');
    return data.movieList;
  } else {
    throw Exception('Try Again');
  }
}

Future<List<Movie>> getSearchedMovies(String value) async {
  final response = await http.get(Uri.parse(originals));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(jsonData['results']);
    return value == ''
        ? data.movieList
        : data.movieList
            .where((element) => element.orginaltitle!
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList();
  } else {
    throw Exception('try again');
  }
}
