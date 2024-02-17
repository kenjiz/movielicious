import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/core/extensions/list_extension.dart';
import 'package:movielicious/src/features/genres/domain/models/genre.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    required this.title,
    required this.year,
    required this.genres,
    required this.runtime,
    required this.voteAverage,
    super.key,
  });

  final String title;
  final String year;
  final List<Genre> genres;
  final String runtime;
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kAppHorizontalMargin,
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              '$year • ${genres.getGenresAsString} • $runtime',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text('★ $voteAverage')
          ].addEqualGap(
            gap: const Gap(5),
            endGap: const Gap(15),
          ),
        ),
      ),
    );
  }
}
