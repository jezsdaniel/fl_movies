part of 'movies_list_bloc.dart';

enum MoviesListStatus { initial, fetching, success, failure }

class MoviesListState {
  const MoviesListState({
    required this.movies,
    required this.status,
  });

  factory MoviesListState.initial() => const MoviesListState(
        movies: [],
        status: MoviesListStatus.initial,
      );

  final List<Movie> movies;
  final MoviesListStatus status;

  MoviesListState copyWith({
    List<Movie>? movies,
    MoviesListStatus? status,
  }) {
    return MoviesListState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
    );
  }
}
