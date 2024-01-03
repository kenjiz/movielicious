import 'package:flutter/material.dart';

import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/core/widgets/custom_appbar.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/base_movies_bloc.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/horizontal_movie_list_container.dart';
import 'package:movielicious/src/features/home/presentation/widgets/featured_carousel.dart';
import 'package:movielicious/src/features/home/presentation/widgets/home_header.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actionButtons: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;

          return SingleChildScrollView(
            child: Column(
              children: [
                LimitedBox(
                  maxHeight: height * 0.1,
                  child: const HomeHeader(),
                ),
                const SizedBox(height: kAppWidgetMargin),
                LimitedBox(
                  maxHeight: height * 0.3,
                  child: const FeaturedCarousel(),
                ),
                _buildPopularMovieList(),
                _buildUpcomingMovieList(),
                _buildTopRatedMovieList(),
                const SizedBox(height: kAppWidgetMargin),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPoster<B extends BaseMoviesBloc>({
    required String title,
    required Widget widgetList,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kAppHorizontalMargin,
      ),
      child: LimitedBox(
        maxHeight: 300,
        child: HorizontalMovieListContainer<B>(
          title: title,
          list: widgetList,
        ),
      ),
    );
  }

  Widget _buildUpcomingMovieList() {
    return _buildPoster<UpcomingMoviesBloc>(
      title: 'Upcoming Movies',
      widgetList: const MovieList<UpcomingMoviesBloc>(),
    );
  }

  Widget _buildTopRatedMovieList() {
    return _buildPoster<TopRatedMoviesBloc>(
      title: 'Top Rated Movies',
      widgetList: const MovieList<TopRatedMoviesBloc>(),
    );
  }

  Widget _buildPopularMovieList() {
    return _buildPoster<PopularMoviesBloc>(
      title: 'Popular Movies',
      widgetList: const MovieList<PopularMoviesBloc>(),
    );
  }
}
