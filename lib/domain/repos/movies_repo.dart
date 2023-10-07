import 'package:fl_movies/domain/models/movie.dart';
import 'package:fl_movies/domain/services/movies_service.dart';

class MoviesRepository {
  const MoviesRepository({
    required this.service,
  });

  final MoviesService service;

  Future<List<Movie>> getPopularMovies() async => service.getPopularMovies();
}
