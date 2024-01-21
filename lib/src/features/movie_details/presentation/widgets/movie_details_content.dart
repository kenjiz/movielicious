import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/features/movie_details/presentation/bloc/details/movie_details_cubit.dart';

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MovieDetailsCubit>().state;
    print(state.movieDetails?.title);

    return ListView(
      children: const [
        // build image stack

        // build story

        // build gallery
      ],
    );
  }
}
