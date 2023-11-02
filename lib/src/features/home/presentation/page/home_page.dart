import 'package:flutter/material.dart';
import 'package:movielicious/src/features/genre/presentation/widgets/genre_box_list.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/sliver_horizontal_container.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/upcoming_movie_list.dart';

import '../../../movies/presentation/widgets/custom_sliver_app_bar.dart';
import '../../../movies/presentation/widgets/popular_movie_list.dart';
import '../../../movies/presentation/widgets/top_rated_movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final posterHeight = MediaQuery.of(context).size.height * 0.3;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            _buildUpcomingMovieList(posterHeight: posterHeight),
            _buildGenreList(),
            _buildPopularMovieList(posterHeight: posterHeight),
            _buildTopRatedMovieList(posterHeight: posterHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster({
    required double posterHeight,
    required String title,
    required Widget widgetList,
  }) {
    return SliverHorizontalContainer(
      height: posterHeight,
      sectionTitle: title,
      list: widgetList,
    );
  }

  Widget _buildGenreList() {
    return const SliverHorizontalContainer(
      sectionTitle: 'Genres',
      list: GenreBoxList(),
      height: 85,
    );
  }

  Widget _buildUpcomingMovieList({required double posterHeight}) {
    return _buildPoster(
      posterHeight: posterHeight,
      title: 'Upcoming Movies',
      widgetList: const UpcomingMovieList(),
    );
  }

  Widget _buildTopRatedMovieList({required double posterHeight}) {
    return _buildPoster(
      posterHeight: posterHeight,
      title: 'Top Rated Movies',
      widgetList: const TopRatedMovieList(),
    );
  }

  Widget _buildPopularMovieList({required double posterHeight}) {
    return _buildPoster(
      posterHeight: posterHeight,
      title: 'Popular Movies',
      widgetList: const PopularMovieList(),
    );
  }
}
