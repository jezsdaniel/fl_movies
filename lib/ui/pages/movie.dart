import 'package:flutter/material.dart';

import 'package:fl_movies/domain/models/movie.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    required this.movie,
    super.key,
  });

  static Route<void> route(BuildContext context, Movie movie) {
    return MaterialPageRoute(
      builder: (_) => MoviePage(
        movie: movie,
      ),
    );
  }

  final Movie movie;

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
              tag: 'movie-poster-${movie.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  movie.posterFullUrl,
                  fit: BoxFit.cover,
                  height: 360,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              movie.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              movie.releaseDate.year.toString(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Sed euismod, diam id aliquam ultrices, '
              'nunc ipsum tincidunt nunc, '
              'sed aliquet eros nisl sed nunc. '
              'Sed euismod, diam id aliquam ultrices, '
              'nunc ipsum tincidunt nunc, '
              'sed aliquet eros nisl sed nunc. '
              'Sed euismod, diam id aliquam ultrices, '
              'nunc ipsum tincidunt nunc, '
              'sed aliquet eros nisl sed nunc. '
              'Sed euismod, diam id aliquam ultrices, '
              'nunc ipsum tincidunt nunc, '
              'sed aliquet eros nisl sed nunc. '
              'Sed euismod, diam id aliquam ultrices, '
              'nunc ipsum tincidunt nunc, '
              'sed aliquet eros nisl sed nunc. '
              'Sed euismod, diam id aliquam ultrices, '
              'nunc ipsum tincidunt nunc, '
              'sed aliquet eros nisl sed nunc. '
              'Sed euismod, diam id aliquam ultrices, '
              'nunc ipsum tincidunt nunc, '
              'sed aliquet eros nisl sed nunc. '
              'Sed euismod, diam id aliquam ultrices, '
              'nunc ipsum tincidunt nunc, '
              'sed aliquet eros nisl sed nunc.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
