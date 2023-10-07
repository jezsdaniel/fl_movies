import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    super.key,
    required this.movieId,
  });

  static Route<void> route(BuildContext context, int movieId) {
    return MaterialPageRoute(
      builder: (_) => MoviePage(
        movieId: movieId,
      ),
    );
  }

  final int movieId;

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
              tag: 'movie-poster-$movieId',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/sample-poster.jpeg',
                  fit: BoxFit.cover,
                  height: 360,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Movie name',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '2023',
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
