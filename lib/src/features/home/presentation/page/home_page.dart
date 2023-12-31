import 'package:flutter/material.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/horizontal_movie_list_container.dart';
import 'package:movielicious/src/features/home/presentation/widgets/movie_list.dart';
import 'package:movielicious/src/features/home/presentation/widgets/popular_movie_app_bar.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/movies_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          const PopularMovieAppBar(),
          _buildUpcomingMovieList(),
          // _buildGenreList(),
          _buildPopularMovieList(),
          _buildTopRatedMovieList(),
        ],
      ),
    );
  }

  Widget _buildPoster({
    required String title,
    required Widget widgetList,
  }) {
    return HorizontalMovieListContainer(
      title: title,
      list: widgetList,
    );
  }

  // Widget _buildGenreList() {
  //   return const SliverHorizontalContainer(
  //     sectionTitle: 'Genres',
  //     list: GenreBoxList(),
  //     height: 85, //TODO: put this on constant variable
  //   );
  // }

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
