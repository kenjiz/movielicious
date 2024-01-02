import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';
import 'package:movielicious/src/features/movies/application/movie_service.dart';
import 'package:movielicious/src/features/movies/data/movie_repository.dart';
import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/domain/models/movie.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_error.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_page.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_queries.dart';

part 'movies_event.dart';
part 'movies_state.dart';

const throttleDuration = Duration(milliseconds: 200);

EventTransformer<E> throttleDroppable<E>() {
  return (events, mapper) => droppable<E>().call(
        events.throttle(throttleDuration),
        mapper,
      );
}

abstract class BaseMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieService _service;

  BaseMoviesBloc(this._service) : super(const MoviesState()) {
    on<MovieListFetched>(
      _onMovieListFetched,
      transformer: throttleDroppable(),
    );
  }

  void _onMovieListFetched(
    MovieListFetched event,
    Emitter<MoviesState> emit,
  ) async {
    final FutureEitherMoviePage result = fetchMovies(event);

    result.match(
      (error) => _onApiRequestError(error, emit),
      (response) => _onApiRequestSuccess(response, emit),
    );

    await result.run();
  }

  _onApiRequestError(
    ApiRequestError error,
    Emitter<MoviesState> emit,
  ) =>
      emit(state.copyWith(
        status: MoviesStateStatus.failure,
        error: MovieError(
          errorMessage: error.message,
        ),
      ));

  _onApiRequestSuccess(
    MoviePage response,
    Emitter<MoviesState> emit,
  ) =>
      state.currentPage < response.totalPages
          ? emit(state.copyWith(
              status: MoviesStateStatus.success,
              movies: List.of(state.movies)..addAll(response.results),
              currentPage: response.page,
              hasReachedMax: false,
            ))
          : emit(state.copyWith(
              hasReachedMax: true,
            ));

  TaskEither<ApiRequestError, MoviePage> fetchMovies(MovieListFetched event) {
    late FutureEitherMoviePage result;

    switch (event.category) {
      case MovieCategory.nowPlaying:
        result = _service.getNowPlayingMovies(event.queries);
        break;
      case MovieCategory.topRated:
        result = _service.getTopRatedMovies(event.queries);
        break;
      case MovieCategory.popular:
        result = _service.getPopularMovies(event.queries);
        break;
      case MovieCategory.upcoming:
        result = _service.getUpcomingMovies(event.queries);
        break;
    }

    return result;
  }

  void next(MovieCategory category) {
    final query = MovieQueries(page: state.currentPage + 1);
    add(MovieListFetched(category: category, queries: query));
  }
}
