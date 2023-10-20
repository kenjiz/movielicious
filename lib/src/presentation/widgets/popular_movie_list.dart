import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/theme_constants.dart';
import '../cubits/popular_movies/popular_movies_cubit.dart';
import 'movie_tile.dart';

import 'circular_icon_button.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(builder: (
      context,
      state,
    ) {
      if (state is PopularMoviesFailed) {
        return Center(
          child: Text(state.error?.statusMessage ?? 'Error loading movie list'),
        );
      }

      if (state is PopularMoviesLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.only(
          left: kAppHorizontalMargin,
          right: 40,
        ),
        itemCount: state.movies.length + 1,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index < state.movies.length) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                width: size.width / 3,
                child: MovieTile(
                  movie: state.movies[index],
                  withTitle: false,
                ),
              ),
            );
          }
          return CircularIconButton(
            onPressed: () {},
          );
        },
      );
    });
  }
}
