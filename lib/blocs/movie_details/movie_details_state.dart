part of 'movie_details_bloc.dart';

enum MoviesDetailsStatus { initial, fetching, success, failure }

class MovieDetailsState {
  const MovieDetailsState({
    required this.movie,
    required this.status,
  });

  factory MovieDetailsState.initial() => MovieDetailsState(
        movie: Movie.empty(),
        status: MoviesDetailsStatus.initial,
      );

  final Movie movie;
  final MoviesDetailsStatus status;

  MovieDetailsState copyWith({
    Movie? movie,
    MoviesDetailsStatus? status,
  }) {
    return MovieDetailsState(
      movie: movie ?? this.movie,
      status: status ?? this.status,
    );
  }
}
