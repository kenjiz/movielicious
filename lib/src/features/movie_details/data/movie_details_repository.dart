import 'package:fpdart/fpdart.dart';

import 'package:movielicious/src/core/repository/base_api_repository.dart';
import 'package:movielicious/src/core/service/tmdb_api.dart';
import 'package:movielicious/src/core/typdefs/movie_id.dart';
import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details_error.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details_response.dart';

typedef FutureEitherMovieDetails = TaskEither<MovieDetailsError, MovieDetails>;

class MovieDetailsRepository extends BaseApiRepository {
  final TMDBApi _api;

  const MovieDetailsRepository(this._api);

  FutureEitherMovieDetails getMovieDetails(MovieId id) {
    return processRequest<MovieDetailsResponse>(
      request: () => _api.getMovieDetails(id),
    ).flatMap<MovieDetails>(_toMovieDetails).mapLeft(transformError);
  }

  // map to [MovieDetails]
  FutureEitherMovieDetails _toMovieDetails(MovieDetailsResponse response) {
    return TaskEither.right(MovieDetails.mapper(response));
  }

  @override
  MovieDetailsError transformError(ApiRequestError e) {
    return MovieDetailsError(message: e.error.toString());
  }

  /// Same as getMovieDetails but using Do notation
  /// this is just for reference only.
  FutureEitherMovieDetails getDetails(MovieId id) =>
      TaskEither<ApiRequestError, MovieDetailsResponse>.Do(
        ($) => $(processRequest<MovieDetailsResponse>(
            request: () => _api.getMovieDetails(id))),
      ).flatMap<MovieDetails>(_toMovieDetails).mapLeft(transformError);
}
