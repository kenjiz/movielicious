import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/adaptive_progress_indicator.dart';
import '../../../../core/widgets/failed_message.dart';
import '../../../../core/widgets/horizontal_list.dart';
import '../../../movies/presentation/cubits/top_rated_movies/top_rated_movies_cubit.dart';

class TopRatedMovieList extends StatelessWidget {
  const TopRatedMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        switch (state) {
          case TopRatedMoviesFailed():
            return FailedMessage(
              message: state.error?.statusMessage ?? 'Error loading movie list',
            );

          case TopRatedMoviesLoading():
            return const AdaptiveProgressIndicator();

          case TopRatedMoviesSuccess():
            return HorizontalMovieList(movies: state.movies);
        }
      },
    );
  }
}
