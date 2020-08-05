import 'package:imdb_app/data/movie.dart';
import 'package:imdb_app/data/movie_mock.dart';
import 'package:imdb_app/data/movie_prod.dart';

enum Flavor { MOCK, PROD }

//Dependency Injector
//Use data mock data for  testing purposes
class Injector {

  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  MovieRepository get movieRepository {

    print('Data getting fetched from '+_flavor.toString());

    switch (_flavor) {

      case Flavor.PROD:
        return new MovieProdRepository();

        default:
        return new MockMovieRepository();
    }
  }
}
