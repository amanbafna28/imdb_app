import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_app/data/movie.dart';
import 'package:imdb_app/utilities/responsive.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;

  MovieScreen({this.movie});

  @override
  Widget build(BuildContext context) {
    var movieSign;
    if (movie.rating > 6) {
      movieSign = '👌';
    } else {
      movieSign = '👍';
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Center(
                child: Column(

                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Resp.height(3, context)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        child: Image.network(
                          'http://image.tmdb.org/t/p/original' + movie.posterUrl,
                          height: Resp.height(50, context),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(top: Resp.height(2, context)),
                            child: Container(
                              width: Resp.width(70, context),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  movie.title,
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Resp.width(4, context)),
                            child: Container(
                                width: Resp.width(45, context),
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'IMDB rating - ' +
                                          movie.rating.toString() +
                                          movieSign,
                                      style:
                                          GoogleFonts.dmSans(color: Colors.white),
                                    ))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Resp.width(10, context),bottom: Resp.height(2, context)),
                            child: Container(
                                width: Resp.width(35, context),
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'OVERVIEW',
                                      style: GoogleFonts.luckiestGuy(
                                          color: Colors.white),
                                    ))),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Resp.width(10, context),
                            ),
                            child: Text(
                              movie.description,
                              textScaleFactor: 1.5,
                              style: GoogleFonts.hindGuntur(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Resp.width(3, context), top: Resp.height(3, context)),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: Resp.width(7, context),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
