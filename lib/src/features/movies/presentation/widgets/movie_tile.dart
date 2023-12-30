import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_with_genre.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/rating_box.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
    this.withTitle = true,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
  });

  final MovieWithGenre movie;
  final double horizontalMargin;
  final double verticalMargin;
  final bool withTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
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
        if (withTitle)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(kAppBorderRadius),
                bottomRight: Radius.circular(kAppBorderRadius),
              ),
              child: LimitedBox(
                maxHeight: 60,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          kBaseImagePath + movie.posterPath,
                          scale: 1,
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(0),
                      height: 40,
                      child: Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        Positioned(
          right: 10,
          top: 10,
          child: RatingBox(
            rating: movie.vote.toStringAsPrecision(2),
          ),
        )
      ],
    );
  }
}
