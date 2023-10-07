import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:fl_movies/domain/models/movie.dart';

class MoviesService {
  MoviesService({
    http.Client? httpClient,
    this.baseUrl = 'https://api.themoviedb.org/3',
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client _httpClient;

  Uri getUrl({
    required String url,
  }) {
    return Uri.parse('$baseUrl/$url');
  }

  Map<String, String> getHeaders() {
    return {
      'Authorization':
          'Bearer ${const String.fromEnvironment('THEMOVIEDB_API_KEY')}',
      'accept': 'application/json',
    };
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await _httpClient.get(
        getUrl(url: 'movie/popular?language=en-US&page=1'),
        headers: getHeaders(),
      );
      if (response.statusCode == 200) {
        return List<Movie>.from(
          ((json.decode(response.body) as Map<String, dynamic>)['results']
                  as List<dynamic>)
              .map((e) => Movie.fromJson(e as Map<String, dynamic>)),
        );
      } else {
        throw Exception('Error getting movies');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Movie> getMovie(int movieId) async {
    try {
      final response = await _httpClient.get(
        getUrl(url: 'movie/$movieId?language=en-US'),
        headers: getHeaders(),
      );
      if (response.statusCode == 200) {
        return Movie.fromJson(
          json.decode(response.body) as Map<String, dynamic>,
        );
      } else {
        throw Exception('Error getting movies');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
