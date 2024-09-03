import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/enums/state_status.dart';
import 'package:movielicious/src/core/typdefs/movie_id.dart';
import 'package:movielicious/src/features/movie_details/data/movie_details_repository.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details_error.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this._repository) : super(const MovieDetailsState());

  final MovieDetailsRepository _repository;

  void getDetails(MovieId id) async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = _repository.getDetails(id);
    await result
        .match(
          (MovieDetailsError e) => emit(
            state.copyWith(
              error: e,
              status: StateStatus.failure,
            ),
          ),
          (MovieDetails movieDetails) => emit(
            state.copyWith(
              movieDetails: movieDetails,
              status: StateStatus.success,
            ),
          ),
        )
        .run();
  }
}
