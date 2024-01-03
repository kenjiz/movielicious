import 'package:flutter/material.dart';

import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/listings/base_movies_bloc.dart';
import 'package:movielicious/src/features/movies/presentation/pages/movie_listing_page.dart';

class HorizontalMovieListContainer<B extends BaseMoviesBloc> extends StatelessWidget {
  const HorizontalMovieListContainer({
    super.key,
    required this.title,
    required this.list,
  });

  final String title;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: kTextStyleHeading4,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovieListingPage<B>(
                        title: title,
                      ),
                    ),
                  );
                },
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: kAccentColor,
                      ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: kAppTitleMargin),
        Expanded(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: <Color>[
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.transparent,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0, 0.25, 0.5, 0.85, 1],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: list,
          ),
        ),
      ],
    );
  }
}
