import 'package:flutter/material.dart';

import '../../../genre/presentation/widgets/genre_box_list.dart';
import '../../../../core/widgets/sliver_horizontal_container.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../widgets/popular_movie_list.dart';
import '../widgets/top_rated_movie_list.dart';
import '../widgets/upcoming_movie_list.dart';

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
            _buildGenreList(),
            _buildPopularMovieList(),
            _buildTopRatedMovieList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster({
    required String title,
    required Widget widgetList,
  }) {
    return SliverHorizontalContainer(
      sectionTitle: title,
      list: widgetList,
    );
  }

  Widget _buildGenreList() {
    return const SliverHorizontalContainer(
      sectionTitle: 'Genres',
      list: GenreBoxList(),
      height: 85, //TODO: put this on constant variable
    );
  }

  Widget _buildUpcomingMovieList() {
    return _buildPoster(
      title: 'Upcoming Movies',
      widgetList: const UpcomingMovieList(),
    );
  }

  Widget _buildTopRatedMovieList() {
    return _buildPoster(
      title: 'Top Rated Movies',
      widgetList: const TopRatedMovieList(),
    );
  }

  Widget _buildPopularMovieList() {
    return _buildPoster(
      title: 'Popular Movies',
      widgetList: const PopularMovieList(),
    );
  }
}
