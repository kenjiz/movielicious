import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/theme_constants.dart';
import 'genre_box.dart';

import '../cubit/genre/genre_cubit.dart';

class GenreBoxList extends StatelessWidget {
  const GenreBoxList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        switch (state) {
          case GenreLoading():
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case GenreFailed():
            final error = state.error!;
            return Center(
              child: Text(error.statusMessage.toString()),
            );
          case GenreSuccess():
            final genres = state.genres;
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
      },
    );
  }
}
