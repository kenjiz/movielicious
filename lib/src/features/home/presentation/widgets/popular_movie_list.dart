import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/core/widgets/adaptive_progress_indicator.dart';
import 'package:movielicious/src/core/widgets/failed_message.dart';

import '../../../../core/widgets/horizontal_list.dart';
import '../../../movies/presentation/cubits/popular_movies/popular_movies_cubit.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        switch (state) {
          case PopularMoviesFailed():
            return FailedMessage(
              message: state.error?.statusMessage ?? 'Error loading movie list',
            );

          case PopularMoviesLoading():
            return const AdaptiveProgressIndicator();

          case PopularMoviesSuccess():
            return HorizontalMovieList(movies: state.movies);
        }
      },
    );
  }
}
