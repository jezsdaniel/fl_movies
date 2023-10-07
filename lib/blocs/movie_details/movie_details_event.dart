part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class MovieDetailsFetchEvent extends MovieDetailsEvent {
  MovieDetailsFetchEvent(this.movieId);

  final int movieId;
}
