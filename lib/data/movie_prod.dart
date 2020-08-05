import 'dart:convert';
import 'package:imdb_app/data/movie.dart';
import 'package:http/http.dart' as http;
import '../utilities/constants.dart';

class MovieProdRepository implements MovieRepository {
  @override


  Future<List<Movie>> fetchMovies(String url) async {
    //imdb movie url
//    String moviesUrl =
//        "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1";

    http.Response response = await http.get(url);
    String movies = response.body;
    final List responseBody = jsonDecode(movies)['results'];

    print('getting movies!');
    //Using status code to check if json received..

    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error occured : [Status Code: $statusCode]");
    }

    //Getting data from json body returned by url..
    return responseBody.map((m) => new Movie.fromMap(m)).toList();
  }
}
