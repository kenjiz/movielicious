import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/http_constants.dart';
import '../cubits/popular_movies/popular_movies_cubit.dart';
import 'search_field.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        return SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          titleSpacing: 0,
          centerTitle: true,
          collapsedHeight: 70,
          expandedHeight: 300,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            title: const SearchField(),
            expandedTitleScale: 1.3,
            titlePadding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
            ),
            centerTitle: false,
            background: Stack(
              alignment: Alignment.center,
              children: [
                if (state is PopularMoviesLoading)
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                if (state is PopularMoviesFailed)
                  Center(
                    child: Text(
                      state.error?.statusMessage ?? 'Photo not found',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (state is PopularMoviesSuccess)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          // get the first movie poster path
                          kBaseImagePath + state.movies.first.posterPath,
                          scale: 1,
                        ),
                      ),
                    ),
                  ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
