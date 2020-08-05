import 'package:imdb_app/data/movie.dart';
import 'package:imdb_app/dependency_injection.dart';

abstract class MovieListView {
  //Two methods - one if movies are loaded other if there is some error
  void onMovieListLoaded(List<Movie> movies);

  void onMovieListError();

}

class MovieListPresenter {

  MovieListView _view;
  MovieRepository _movieRepository;

  MovieListPresenter(this._view) {
    _movieRepository = new Injector().movieRepository;
  }

  void loadMovies(String url) {
    _movieRepository.fetchMovies(url).then((movies) {
      _view.onMovieListLoaded(movies);
    }).catchError((onError) {
      _view.onMovieListError();
    });
  }

}
