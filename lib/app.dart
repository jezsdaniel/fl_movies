import 'package:fl_movies/domain/repos/movies_repo.dart';
import 'package:fl_movies/domain/services/movies_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fl_movies/l10n/l10n.dart';
import 'package:fl_movies/ui/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: (_) => HomePage.route(),
      builder: (context, child) {
        return RepositoryProvider(
          create: (context) => MoviesRepository(
            service: MoviesService(),
          ),
          child: child,
        );
      },
    );
  }
}
