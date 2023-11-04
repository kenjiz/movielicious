import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entity/genre_response.dart';
import '../../../domain/usecase/get_genres.dart';
import '../../../domain/entity/genre.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final GetGenres usecase;

  GenreCubit(this.usecase) : super(const GenreLoading());

  Future<void> getGenres() async {
    final result = await usecase();

    result.fold(
      (ServerFailure failure) {
        emit(GenreFailed(error: failure));
      },
      (GenreResponse response) {
        final genres = response.genres;
        emit(GenreSuccess(genres: genres));
      },
    );
  }
}
