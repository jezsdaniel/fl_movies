import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fl_movies/domain/models/movie.dart';
import 'package:fl_movies/domain/repos/movies_repo.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({
    required this.moviesRepository,
  }) : super(MovieDetailsState.initial()) {
    on<MovieDetailsFetchEvent>(_onFetchMovieDetails);
  }

  final MoviesRepository moviesRepository;

  Future<void> _onFetchMovieDetails(
    MovieDetailsFetchEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(state.copyWith(status: MoviesDetailsStatus.fetching));
    try {
      final movie = await moviesRepository.getMovie(event.movieId);
      emit(
        state.copyWith(
          movie: movie,
          status: MoviesDetailsStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: MoviesDetailsStatus.failure));
    }
  }
}
