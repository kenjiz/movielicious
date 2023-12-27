import 'package:fpdart/fpdart.dart';

import 'package:movielicious/src/core/errors/failures.dart';
import 'package:movielicious/src/core/repository/base_api_repository.dart';
import 'package:movielicious/src/core/service/tmdb_api.dart';
import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_queries.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_response.dart';

typedef FutureEitherMovies = Future<Either<Failure, MovieResponse>>;

class MovieRepository extends BaseApiRepository {
  final TMDBApi _service;

  const MovieRepository(this._service);

  FutureEitherMovies getMovies(
    MovieCategory category, [
    MovieQueries? queries,
  ]) async {
    return getStateOf<MovieResponse>(
      request: () => _service.getMovies(
        category.meta,
        queries: queries,
      ),
    );
  }
}
