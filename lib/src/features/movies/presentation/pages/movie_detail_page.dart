import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/typdefs/movie_id.dart';
import 'package:movielicious/src/features/movie_details/presentation/bloc/details/movie_details_cubit.dart';
import 'package:movielicious/src/injection_container.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    super.key,
    required this.id,
  });

  final MovieId id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsCubit>(
      create: (_) => MovieDetailsCubit(DI.sl()),
      child: const Placeholder(),
    );
  }
}
