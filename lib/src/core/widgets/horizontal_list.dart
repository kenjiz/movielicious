import 'package:flutter/material.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/core/widgets/circular_icon_button.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_with_genre.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/movie_tile.dart';

class HorizontalMovieList extends StatelessWidget {
  final List<MovieWithGenre> movies;

  const HorizontalMovieList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ListView.builder(
      padding: const EdgeInsets.only(
        left: kAppHorizontalMargin,
        right: 40,
      ),
      itemCount: movies.length + 1,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index < movies.length) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: size.width / 3,
              child: MovieTile(
                movie: movies[index],
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
  }
}
