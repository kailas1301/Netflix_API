class Movie {
  String? title;
  String? backDropPath;
  String? orginaltitle;
  String? overview;
  String? posterPath;
  String? releaseData;
  List? genre;

  Movie(
      {required this.title,
      required this.backDropPath,
      required this.orginaltitle,
      required this.overview,
      required this.posterPath,
      required this.releaseData,
      required this.genre});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'],
        backDropPath: json["backdrop_path"],
        orginaltitle: json["original_title"],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseData: json['release_date'],
        genre: json['genre_ids']);
  }
}

class MovieList {
  List<Movie> movieList;
  MovieList({required this.movieList});

  factory MovieList.fromJson(List<dynamic> json) {
    List<Movie> popular = [];
    popular = json.map((popular) => Movie.fromJson(popular)).toList();
    return MovieList(movieList: popular);
  }
}
