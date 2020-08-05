class Movie {
  String title;
  double rating;
  String posterUrl;
  String description;

  Movie({this.title, this.rating, this.posterUrl, this.description});

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['original_title'],
        posterUrl = map['poster_path'],
        description = map['overview'],
        rating = map['vote_average'];
}

abstract class MovieRepository {
  Future<List<Movie>> fetchMovies(String url);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
