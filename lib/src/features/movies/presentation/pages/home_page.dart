import 'package:flutter/material.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/sliver_horizontal_container.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/upcoming_movie_list.dart';

import '../widgets/custom_sliver_app_bar.dart';
import '../widgets/popular_movie_list.dart';
import '../widgets/top_rated_movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            _buildUpcomingMovieList(),
            _buildPopularMovieList(),
            _buildTopRatedMovieList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingMovieList() {
    return const SliverHorizontalContainer(
      sectionTitle: 'Upcoming Movies',
      list: UpcomingMovieList(),
    );
  }

  Widget _buildTopRatedMovieList() {
    return const SliverHorizontalContainer(
      sectionTitle: 'Top Rated Movies',
      list: TopRatedMovieList(),
    );
  }

  Widget _buildPopularMovieList() {
    return const SliverHorizontalContainer(
      sectionTitle: 'Popular Movies',
      list: PopularMovieList(),
    );
  }
}
