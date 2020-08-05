import 'package:imdb_app/utilities/constants.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:imdb_app/data/movie_prod.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements http.Client {

  main() {
    group('fetchMovies', () {
      test('returns a Post if Http call completed succesfully', () async {
        final client = MockClient();

        var url = 'https://api.themoviedb.org/3/search/movie?api_key=6b55665cb6be0c478bf9ebde60593a97&language=en-US&query=rockstar&page=1&include_adult=false';

        when(client.get(url).then((_) async=> http.Response('',200)));

      });
    });
  }
}