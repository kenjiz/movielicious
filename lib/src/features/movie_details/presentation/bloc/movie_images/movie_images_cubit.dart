import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';

part 'movie_images_state.dart';

class MovieImagesCubit extends Cubit<MovieImagesState> {
  MovieImagesCubit(this._repository)
      : super(const MovieImagesState(movieImages: []));

  final MovieDetailsRepository _repository;

  void getImages(MovieId id) async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = _repository.getMovieImages(id);
    await result
        .match(
          (MovieDetailsError e) => emit(
            state.copyWith(
              error: e,
              status: StateStatus.failure,
            ),
          ),
          (List<MovieImage> images) => emit(
            state.copyWith(
              movieImages: images,
              status: StateStatus.success,
            ),
          ),
        )
        .run();
  }
}
