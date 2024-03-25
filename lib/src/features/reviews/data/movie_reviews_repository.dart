import 'package:fpdart/fpdart.dart';
import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';

typedef FutureEitherMovieReviewsResponse
    = TaskEither<MovieReviewsError, MovieReviewsResponse>;

class MovieReviewsRepository extends BaseApiRepository {
  final TMDBApi _api;

  const MovieReviewsRepository(this._api);

  FutureEitherMovieReviewsResponse getMovieReviews(MovieId id, int page) {
    return processRequest<MovieReviewsResponse>(
        request: () => _api.getReviews(id, page: page)).mapLeft(transformError);
  }

  @override
  MovieReviewsError transformError(ApiRequestError e) {
    return MovieReviewsError(message: e.error.toString());
  }
}
