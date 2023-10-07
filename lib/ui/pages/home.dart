import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fl_movies/blocs/movies_list/movies_list_bloc.dart';
import 'package:fl_movies/domain/repos/movies_repo.dart';
import 'package:fl_movies/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesListBloc(
        moviesRepository: context.read<MoviesRepository>(),
      ),
      child: const _HomeUI(),
    );
  }
}

class _HomeUI extends StatefulWidget {
  const _HomeUI();

  @override
  State<_HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<_HomeUI> {
  @override
  void initState() {
    context.read<MoviesListBloc>().add(MoviesListFetchPopularEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular Movies',
        ),
      ),
      body: BlocBuilder<MoviesListBloc, MoviesListState>(
        builder: (context, state) {
          if (state.status == MoviesListStatus.fetching) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.count(
            padding: const EdgeInsets.only(
              right: 8,
              top: 16,
              bottom: 32,
              left: 8,
            ),
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            children: [
              for (final movie in state.movies)
                MovieItem(
                  movie: movie,
                ),
            ],
          );
        },
      ),
    );
  }
}
