import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/core/enums/state_status.dart';
import 'package:movielicious/src/core/extensions/list_extension.dart';
import 'package:movielicious/src/core/widgets/adaptive_progress_indicator.dart';
import 'package:movielicious/src/features/movie_details/presentation/bloc/details/movie_details_cubit.dart';

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MovieDetailsCubit>().state;

    return switch (state.status) {
      StateStatus.loading => const Center(child: AdaptiveProgressIndicator()),
      StateStatus.success => SingleChildScrollView(
          child: Column(
            children: _buildChildContent(context, state),
          ),
        ),
      StateStatus.failure =>
        Center(child: Text(state.error?.message ?? 'Error')),
    };
  }

  List<Widget> _buildChildContent(
      BuildContext context, MovieDetailsState state) {
    final details = state.movieDetails!;
    return [
      AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            Image.network(details.backdropPath, fit: BoxFit.cover),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.black87, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Padding(
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
                      details.title,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                        '${details.year} • ${details.genres.getGenresAsString} • ${details.runtime}',
                        style: Theme.of(context).textTheme.labelSmall),
                    Text('★ ${details.voteAverage}')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Story',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            ExpandText(
              details.overview,
              maxLines: 4,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    ];
  }
}
