import 'package:flutter/material.dart';

import 'package:fl_movies/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular Movies',
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        children: List.generate(20, (index) {
          return MovieItem(
            movieId: index,
          );
        }),
      ),
    );
  }
}
