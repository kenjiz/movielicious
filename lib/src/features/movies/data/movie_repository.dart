import 'package:fpdart/fpdart.dart';

import 'package:movielicious/src/core/repository/base_api_repository.dart';
import 'package:movielicious/src/core/service/tmdb_api.dart';
import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';
import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_queries.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_response.dart';

typedef FutureEitherMovieResponse = TaskEither<ApiRequestError, MovieResponse>;

class MovieRepository extends BaseApiRepository {
  final TMDBApi _api;

  const MovieRepository(this._api);

  FutureEitherMovieResponse getMovies(
    MovieCategory category, [
    MovieQueries? queries,
  ]) {
    return processRequest<MovieResponse>(
      request: () => _api.getMovies(category.meta, queries: queries),
    );
  }
}
