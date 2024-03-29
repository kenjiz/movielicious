import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';
import 'package:movielicious/src/features/movie_details/presentation/widgets/movie_credits_container.dart';
import 'package:movielicious/src/features/movie_details/presentation/widgets/review_list_container.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';
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
          create: (context) => DI.sl<MovieGalleryCubit>()..getImages(movieId),
        ),
        BlocProvider(
          create: (context) => DI.sl<MovieCreditsCubit>()..getCredits(movieId),
        ),
        BlocProvider(
          create: (context) => DI.sl<ReviewsBloc>()
            ..add(ReviewListFetched(id: movieId, page: 1)),
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
              return _MovieDetails(
                id: movieId,
                movieTitle: title,
                details: details,
              );

            case StateStatus.failure:
              return Center(child: Text(state.error?.message ?? 'Error'));
          }
        }),
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  const _MovieDetails({
    required this.id,
    required this.movieTitle,
    required this.details,
  });

  final MovieDetails details;
  final MovieId id;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MovieHeaderContainer(
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
        const MovieGalleryContainer(),
        const MovieCreditsContainer(),
        ReviewListContainer(
          id: id,
          movieTitle: movieTitle,
        ),
      ].addEqualGap(gap: const Gap(20)),
    );
  }
}
