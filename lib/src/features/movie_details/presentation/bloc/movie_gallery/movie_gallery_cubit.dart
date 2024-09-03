import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';

part 'movie_gallery_state.dart';

class MovieGalleryCubit extends Cubit<MovieGalleryState> {
  MovieGalleryCubit(this._repository)
      : super(const MovieGalleryState(images: []));

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
              images: images,
              status: StateStatus.success,
            ),
          ),
        )
        .run();
  }
}
