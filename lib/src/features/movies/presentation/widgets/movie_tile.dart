import 'package:flutter/material.dart';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:movielicious/src/features/movies/domain/models/movie.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/movie_title.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
  });

  final Movie movie;
  final double horizontalMargin;
  final double verticalMargin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(
              movieId: movie.id,
              title: movie.title,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kAppBorderRadius),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalMargin,
                  vertical: verticalMargin,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kAppBorderRadius),
                  image: DecorationImage(
                    image: NetworkImage(
                      kBaseImagePath + movie.posterPath,
                      scale: 1,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: kAppBodyMargin),
          MovieTitle(
            title: movie.title,
            year: movie.getYear,
            genre: movie.genresByName,
            vote: movie.getVote,
          ),
        ],
      ),
    );
  }
}
