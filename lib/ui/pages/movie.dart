import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fl_movies/blocs/movie_details/movie_details_bloc.dart';
import 'package:fl_movies/domain/models/movie.dart';
import 'package:fl_movies/domain/repos/movies_repo.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    required this.movie,
    super.key,
  });

  static Route<void> route(Movie movie) {
    return MaterialPageRoute(
      builder: (_) => MoviePage(
        movie: movie,
      ),
    );
  }

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsBloc(
        moviesRepository: context.read<MoviesRepository>(),
      ),
      child: _MovieUI(movie),
    );
  }
}

class _MovieUI extends StatefulWidget {
  const _MovieUI(this.movie);

  final Movie movie;

  @override
  State<_MovieUI> createState() => _MovieUIState();
}

class _MovieUIState extends State<_MovieUI> {
  @override
  void initState() {
    context
        .read<MovieDetailsBloc>()
        .add(MovieDetailsFetchEvent(widget.movie.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: Column(
          children: [
            Hero(
              tag: 'movie-poster-${widget.movie.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  widget.movie.posterFullUrl,
                  fit: BoxFit.cover,
                  height: 360,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(
                      height: 360,
                      color: Colors.black12,
                      child: Center(
                        child: Icon(
                          Icons.movie_creation_outlined,
                          size: 48,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 16,
            ),
            BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
              listener: (context, state) {
                if (state.status == MoviesDetailsStatus.failure) {
                  Fluttertoast.showToast(
                    msg: 'Failed to fetch movie details.',
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
              },
              builder: (context, state) {
                if (state.status == MoviesDetailsStatus.fetching) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: const CircularProgressIndicator(),
                  );
                } else if (state.status == MoviesDetailsStatus.initial) {
                  return Container();
                }
                return Column(
                  children: [
                    Text(
                      widget.movie.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 16,
                    ),
                    Text(
                      widget.movie.releaseDate.year.toString(),
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      widget.movie.overview,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
