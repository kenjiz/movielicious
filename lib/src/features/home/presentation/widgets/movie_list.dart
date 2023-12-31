import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/core/widgets/adaptive_progress_indicator.dart';
import 'package:movielicious/src/core/widgets/failed_message.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/horizontal_list.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/base_movies_cubit.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/movies_cubit.dart';

class MovieList<B extends BaseMoviesCubit> extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, MoviesState>(
      builder: (context, state) {
        switch (state) {
          case MoviesFailure():
            return FailedMessage(
              message: state.message,
            );

          case MoviesLoading():
            return const AdaptiveProgressIndicator();

          case MoviesLoaded():
            return HorizontalMovieList(movies: state.movies);
        }
      },
    );
  }
}
