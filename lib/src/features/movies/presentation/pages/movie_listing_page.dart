import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/provider/bloc_providers.dart';
import 'package:movielicious/src/core/enums/state_status.dart';
import 'package:movielicious/src/core/widgets/adaptive_progress_indicator.dart';
import 'package:movielicious/src/core/widgets/custom_appbar.dart';
import 'package:movielicious/src/core/widgets/failed_message.dart';

import 'package:movielicious/src/features/movies/movies.dart';

class MovieListingPage<B extends BaseMoviesBloc> extends StatelessWidget {
  final String title;

  const MovieListingPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        actionButtons: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: AppBlocProviders(
        child: BlocBuilder<B, MoviesState>(
          builder: (context, state) => switch (state.status) {
            StateStatus.loading => const AdaptiveProgressIndicator(),
            StateStatus.failure => FailedMessage(message: state.error!.message),
            StateStatus.success => VerticalMovieList<B>(movies: state.movies),
          },
        ),
      ).initialize,
    );
  }
}
