import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/core/typdefs/movie_id.dart';
import 'package:movielicious/src/features/movie_details/presentation/bloc/details/movie_details_cubit.dart';
import 'package:movielicious/src/features/movie_details/presentation/widgets/movie_details_content.dart';
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
    return BlocProvider<MovieDetailsCubit>(
      create: (context) => DI.sl<MovieDetailsCubit>()..getDetails(movieId),
      child: Scaffold(
        body: MovieDetailsContent(),
      ),
    );
  }
}
