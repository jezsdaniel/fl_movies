import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fl_movies/domain/models/movie.dart';
import 'package:fl_movies/domain/repos/movies_repo.dart';

part 'movies_list_event.dart';

part 'movies_list_state.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  MoviesListBloc({
    required this.moviesRepository,
  }) : super(MoviesListState.initial()) {
    on<MoviesListFetchPopularEvent>(_onFetchPopularMovies);
  }

  final MoviesRepository moviesRepository;

  Future<void> _onFetchPopularMovies(
    MoviesListFetchPopularEvent event,
    Emitter<MoviesListState> emit,
  ) async {
    emit(state.copyWith(status: MoviesListStatus.fetching));
    try {
      final movies = await moviesRepository.getPopularMovies();
      emit(
        state.copyWith(
          movies: movies,
          status: MoviesListStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: MoviesListStatus.failure));
    }
  }
}
