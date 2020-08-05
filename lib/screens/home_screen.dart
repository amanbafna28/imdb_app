import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_app/screens/movie_screen.dart';
import 'package:imdb_app/data/movie.dart';
import 'package:imdb_app/modules/movie_presenter.dart';
import 'package:imdb_app/utilities/constants.dart';
import 'package:imdb_app/utilities/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements MovieListView {
  MovieListPresenter _presenter;
  List<Movie> _movies;
  bool isLoading;
  bool showSearch;
  String url;
  TextEditingController searchController = new TextEditingController();

  _HomeScreenState() {
    this._presenter = new MovieListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      url = latestUrl;
    });
    _presenter.loadMovies(url);
    isLoading = true;
    showSearch = false;
  }

  Widget NowPlayingMovies() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Resp.height(3, context),
              horizontal: Resp.width(6, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              showSearch
                  ? Container(
                      child: TextField(
                        onChanged: (searchMovie) {
                          setState(() {
                            String searchUrl =
                                'https://api.themoviedb.org/3/search/movie?api_key=6b55665cb6be0c478bf9ebde60593a97&language=en-US&query=$searchMovie&page=1&include_adult=false';
                            setState(() {
                              url = searchUrl;
                            });
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Search Movies...',
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                      width: Resp.width(50, context),
                    )
                  : Container(
                      width: Resp.width(50, context),
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Now Playing',
                            style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ))),
              Padding(
                padding: EdgeInsets.only(left: Resp.width(22, context)),
                child: showSearch
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: Resp.width(8, context),
                        ),
                        onPressed: () {
                          setState(() {
                            showSearch = false;
                            url = latestUrl;
                          });
                        })
                    : IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Resp.width(8, context),
                        ),
                        onPressed: () {
                          setState(() {
                            showSearch = true;
                          });
                        }),
              )
            ],
          ),
        ),
        Flexible(
            child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _movies.length,
          itemBuilder: (BuildContext context, int index) {
            final Movie movie = _movies[index];
            return _movieWidget(movie);
          },
        )),
      ],
    );
  }

  Widget _movieWidget(Movie movie) {
    return Padding(
      padding: EdgeInsets.all(Resp.width(3, context)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MovieScreen(
                        movie: movie,
                      )));
        },
        child: Container(
          color: Colors.deepPurpleAccent[200],
          child: Image.network(
            'http://image.tmdb.org/t/p/original' + movie.posterUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NowPlayingMovies(),
      ),
    );
  }

  @override
  void onMovieListError() {}

  @override
  void onMovieListLoaded(List<Movie> movies) {
    setState(() {
      _movies = movies;
      isLoading = false;
    });
  }
}

//'http://image.tmdb.org/t/p/original' + movie.posterUrl
