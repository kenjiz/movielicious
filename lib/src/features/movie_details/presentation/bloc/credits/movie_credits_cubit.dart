import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_cast.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';

part 'movie_credits_state.dart';

class MovieCreditsCubit extends Cubit<MovieCreditsState> {
  MovieCreditsCubit(this._repository) : super(MovieCreditsState.initial());

  final MovieDetailsRepository _repository;

  Future<void> getCredits(MovieId id) async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = _repository.getMovieCredits(id);
    await result
        .match(
          (MovieDetailsError e) => emit(
            state.copyWith(
              error: e,
              status: StateStatus.failure,
            ),
          ),
          (List<MovieCast> casts) => emit(
            state.copyWith(
              casts: casts,
              status: StateStatus.success,
            ),
          ),
        )
        .run();
  }
}
