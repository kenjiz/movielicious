import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/features/movies/domain/models/movie.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/movie_title.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/rating_box.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
    this.withTitle = true,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
  });

  final Movie movie;
  final double horizontalMargin;
  final double verticalMargin;
  final bool withTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        MovieTitle(
          title: movie.title,
          year: movie.getYear,
          genre: movie.genresByName,
          vote: movie.getVote,
        ),
      ],
    );
  }
}
