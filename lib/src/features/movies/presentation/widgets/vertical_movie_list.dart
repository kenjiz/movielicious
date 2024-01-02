import 'package:flutter/widgets.dart';

import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/features/movies/domain/models/movie.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/movie_tile.dart';

class VerticalMovieList extends StatelessWidget {
  const VerticalMovieList({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalMargin),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1.5 / 3,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => MovieTile(movie: movies[index]),
        itemCount: movies.length,
      ),
    );
  }
}
