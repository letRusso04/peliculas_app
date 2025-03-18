import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _ApiKeys = 'bc980470b901cbd2f2f6099d6261322f';
  final String _BaseUrl = 'api.themoviedb.org';
  final String _Language = 'es-ES';
  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPopular = [];
  MoviesProvider() {
    this.getOnDisplayMovies();
    this.getOnDisplayPopular();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_BaseUrl, '3/movie/now_playing', {
      'api_key': _ApiKeys,
      'language': _Language,
      'page': '1',
    });
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;
  }

  getOnDisplayPopular() async {
    var url = Uri.https(_BaseUrl, '3/movie/popular', {
      'api_key': _ApiKeys,
      'language': _Language,
      'page': '1',
    });
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    onDisplayPopular = [...onDisplayPopular, ...popularResponse.results];
  }
}
