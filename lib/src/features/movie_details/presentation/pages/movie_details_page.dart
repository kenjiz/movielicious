import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:movielicious/src/core/enums/state_status.dart';
import 'package:movielicious/src/core/extensions/list_extension.dart';
import 'package:movielicious/src/core/typdefs/movie_id.dart';
import 'package:movielicious/src/core/widgets/adaptive_progress_indicator.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';
import 'package:movielicious/src/injection_container.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    super.key,
    required this.movieId,
    required this.title,
  });

  final MovieId movieId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailsCubit>(
          create: (context) => DI.sl<MovieDetailsCubit>()..getDetails(movieId),
        ),
        BlocProvider(
          create: (context) => DI.sl<MovieImagesCubit>()..getImages(movieId),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, state) {
          switch (state.status) {
            case StateStatus.loading:
              return const Center(child: AdaptiveProgressIndicator());

            case StateStatus.success:
              final details = state.movieDetails!;
              return _MovieDetails(details: details);

            case StateStatus.failure:
              return Center(child: Text(state.error?.message ?? 'Error'));
          }
        }),
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  const _MovieDetails({required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MoviePosterContainer(
          backgroundImage: details.backdropPath,
          child: MovieTitle(
            title: details.title,
            genres: details.genres,
            runtime: details.runtime,
            voteAverage: details.voteAverage,
            year: details.year,
          ),
        ),
        MovieStoryOverview(content: details.overview),
        const MovieImagesContainer(),
      ].addEqualGap(gap: const Gap(20)),
    );
  }
}
