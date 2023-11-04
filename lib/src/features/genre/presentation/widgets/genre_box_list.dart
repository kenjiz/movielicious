import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/core/widgets/failed_message.dart';

import '../../../../core/widgets/adaptive_progress_indicator.dart';
import '../../../../core/constants/theme_constants.dart';
import '../../domain/entity/genre.dart';
import '../cubit/genre/genre_cubit.dart';
import 'genre_box.dart';

class GenreBoxList extends StatelessWidget {
  const GenreBoxList({
    super.key,
  });

  Widget _buildList({required List<Genre> genres}) {
    return ListView.builder(
      itemCount: genres.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(
        left: kAppHorizontalMargin,
        right: 40,
      ),
      itemBuilder: (context, index) {
        return GenreBox(
          genre: genres[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        switch (state) {
          case GenreLoading():
            return const AdaptiveProgressIndicator();

          case GenreFailed():
            final errorMessage = state.error.statusMessage!;
            return FailedMessage(message: errorMessage);

          case GenreSuccess():
            final genres = state.genres;
            return _buildList(genres: genres);
        }
      },
    );
  }
}
