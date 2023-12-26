import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/movies_by_genres/movies_by_genres_cubit.dart';
import '../../../../core/widgets/adaptive_progress_indicator.dart';
import '../../../../injection_container.dart';
import '../../../genre/domain/entity/genre.dart';

class MoviesByGenresPage extends StatelessWidget {
  final Genre genre;
  const MoviesByGenresPage({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesByGenresCubit>(
      create: (context) => MoviesByGenresCubit(InjectionContainer.sl())..getMoviesByGenres(genre: genre),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Genre: ${genre.name}'),
        ),
        body: BlocBuilder<MoviesByGenresCubit, MoviesByGenresState>(
          builder: (context, state) {
            switch (state) {
              case MoviesByGenresLoading():
                return const CircularProgressIndicator();
              case MoviesByGenresFailed():
                return Container();
              case MoviesByGenresSuccess():
                return Container();
            }
          },
        ),
      ),
    );
  }
}
