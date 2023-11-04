import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/adaptive_progress_indicator.dart';
import '../../../../core/widgets/failed_message.dart';
import '../../../movies/presentation/cubits/upcoming_movies/upcoming_movies_cubit.dart';
import '../../../../core/widgets/horizontal_list.dart';

class UpcomingMovieList extends StatelessWidget {
  const UpcomingMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
      builder: (context, state) {
        switch (state) {
          case UpcomingMoviesFailed():
            return FailedMessage(
              message: state.error?.statusMessage ?? 'Error loading movie list',
            );

          case UpcomingMoviesLoading():
            return const AdaptiveProgressIndicator();

          case UpcomingMoviesSuccess():
            return HorizontalMovieList(movies: state.movies);
        }
      },
    );
  }
}
