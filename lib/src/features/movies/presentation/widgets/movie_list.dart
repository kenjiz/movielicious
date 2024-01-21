import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/core/enums/state_status.dart';

import 'package:movielicious/src/core/widgets/adaptive_progress_indicator.dart';
import 'package:movielicious/src/core/widgets/failed_message.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/listings/base_movies_bloc.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/horizontal_list.dart';

class MovieList<B extends BaseMoviesBloc> extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, MoviesState>(
      builder: (context, state) => switch (state.status) {
        StateStatus.success => HorizontalMovieList(movies: state.movies),
        StateStatus.loading => const AdaptiveProgressIndicator(),
        StateStatus.failure => FailedMessage(message: state.error!.message),
      },
    );
  }
}
