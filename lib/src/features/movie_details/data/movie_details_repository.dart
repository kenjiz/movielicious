import 'package:fpdart/fpdart.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_cast.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_credits_response.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';

typedef FutureEitherMovieDetails = TaskEither<MovieDetailsError, MovieDetails>;

typedef FutureEitherMovieImages
    = TaskEither<MovieDetailsError, List<MovieImage>>;

typedef FutureEitherMovieCredits
    = TaskEither<MovieDetailsError, List<MovieCast>>;

class MovieDetailsRepository extends BaseApiRepository {
  final TMDBApi _api;

  const MovieDetailsRepository(this._api);

  FutureEitherMovieDetails getMovieDetails(MovieId id) {
    return processRequest<MovieDetailsResponse>(
      request: () => _api.getMovieDetails(id),
    ).flatMap<MovieDetails>(_toMovieDetails).mapLeft(transformError);
  }

  FutureEitherMovieImages getMovieImages(MovieId id) {
    return processRequest<MovieImageResponse>(
      request: () => _api.getMovieImages(id),
    ).flatMap<List<MovieImage>>(_toMovieImage).mapLeft(transformError);
  }

  FutureEitherMovieCredits getMovieCredits(MovieId id) {
    return processRequest<MovieCreditsResponse>(
      request: () => _api.getMovieCredits(id),
    ).flatMap<List<MovieCast>>(_toMovieCast).mapLeft(transformError);
  }

  // map to [MovieDetails]
  FutureEitherMovieDetails _toMovieDetails(MovieDetailsResponse response) {
    return TaskEither.right(MovieDetails.mapper(response));
  }

  // map to [MovieImage]
  FutureEitherMovieImages _toMovieImage(MovieImageResponse response) {
    return TaskEither.right(response.backdrops);
  }

  // map to [MovieCast]
  FutureEitherMovieCredits _toMovieCast(MovieCreditsResponse response) {
    return TaskEither.right(response.cast);
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
