import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/bloc_providers.dart';
import 'package:movielicious/src/core/widgets/adaptive_progress_indicator.dart';
import 'package:movielicious/src/core/widgets/custom_appbar.dart';
import 'package:movielicious/src/core/widgets/failed_message.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/base_movies_bloc.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/vertical_movie_list.dart';

class MovieListingPage<B extends BaseMoviesBloc> extends StatelessWidget {
  final String title;

  const MovieListingPage({
    super.key,
    required this.title,
  });

  static const String route = 'movie-listing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: AppBlocProviders(
        child: BlocBuilder<B, MoviesState>(
          builder: (context, state) => switch (state.status) {
            MoviesStateStatus.loading => const AdaptiveProgressIndicator(),
            MoviesStateStatus.failure => FailedMessage(message: state.error!.message),
            MoviesStateStatus.success => VerticalMovieList(movies: state.movies),
          },
        ),
      ).initialize,
    );
  }
}
