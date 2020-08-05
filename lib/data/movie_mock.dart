import 'package:imdb_app/data/movie.dart';

class MockMovieRepository implements MovieRepository {
  @override
  Future<List<Movie>> fetchMovies(String url) {
    return new Future.value(movies);
  }
}
//Dummy Data

var movies = <Movie>[
  new Movie(
      title: "Rockstar",
      description: "Movie based on Music",
      rating: 8.0,
      posterUrl: "/h7w2tl1FJXnqeIA6nB6AN3B9Aa0.jpg"),
  new Movie(
      title: "Welcome",
      description: "Comedy movie based on Dubai Don",
      rating: 7.0,
      posterUrl: "/fudxnXlTTBIDCkpR7XhlIgkNaUY.jpg"),
  new Movie(
      title: "3 Idiots",
      description: "One of the best Indian movies based on education",
      rating: 8.1,
      posterUrl: "/k1iWMypGjk1b59oCHLtyfd4hw99.jpg")
];
