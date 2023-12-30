import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';

import 'package:movielicious/src/features/movies/application/movie_service.dart';
import 'package:movielicious/src/features/movies/data/movie_repository.dart';
import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_page.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_queries.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/movies_cubit.dart';

class BaseMoviesCubit extends Cubit<MoviesState> {
  final MovieService _service;

  BaseMoviesCubit(this._service) : super(const MoviesLoading());

  Future<void> fetchMoviesByCategory(
    MovieCategory category, [
    MovieQueries? queries,
  ]) async {
    emit(const MoviesLoading());

    late FutureEitherMoviePage result;

    switch (category) {
      case MovieCategory.nowPlaying:
        result = _service.getNowPlayingMovies(queries);
        break;
      case MovieCategory.topRated:
        result = _service.getTopRatedMovies(queries);
        break;
      case MovieCategory.popular:
        result = _service.getPopularMovies(queries);
        break;
      case MovieCategory.upcoming:
        result = _service.getUpcomingMovies(queries);
        break;
    }

    result.match(_processResponseError, _processMovieResponse).run();
  }

  void _processMovieResponse(MoviePage moviePage) => emit(
        MoviesLoaded(
          movies: moviePage.results,
          page: moviePage.page,
          totalPages: moviePage.totalPages,
          totalResults: moviePage.totalResults,
        ),
      );

  void _processResponseError(ApiRequestError error) => emit(
        MoviesFailure(error.message),
      );
}
