import 'package:flutter/material.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/core/widgets/custom_appbar.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/horizontal_movie_list_container.dart';

import 'package:movielicious/src/features/home/presentation/widgets/featured_carousel.dart';
import 'package:movielicious/src/features/home/presentation/widgets/home_header.dart';
import 'package:movielicious/src/features/home/presentation/widgets/movie_list.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/movies_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPoster({
    required String title,
    required Widget widgetList,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kAppHorizontalMargin),
      child: LimitedBox(
        maxHeight: 300,
        child: HorizontalMovieListContainer(
          title: title,
          list: widgetList,
        ),
      ),
    );
  }

  Widget _buildUpcomingMovieList() {
    return _buildPoster(
      title: 'Upcoming Movies',
      widgetList: const MovieList<UpcomingMoviesCubit>(),
    );
  }

  Widget _buildTopRatedMovieList() {
    return _buildPoster(
      title: 'Top Rated Movies',
      widgetList: const MovieList<TopRatedMoviesCubit>(),
    );
  }

  Widget _buildPopularMovieList() {
    return _buildPoster(
      title: 'Popular Movies',
      widgetList: const MovieList<PopularMoviesCubit>(),
    );
  }
}
