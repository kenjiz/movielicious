import 'package:dartz/dartz.dart';
import 'package:movielicious/src/features/genre/domain/entity/genre_queries.dart';

import '../../../../core/enums/list_category.dart';
import '../../../../core/errors/failures.dart';
import '../../../credit/domain/entity/credit_response.dart';
import '../../../genre/domain/entity/genre_response.dart';
import '../../../reviews/domain/entity/review_queries.dart';
import '../../../reviews/domain/entity/review_response.dart';
import '../../../search/domain/entity/search_queries.dart';
import '../entity/movie_queries.dart';
import '../entity/movie_response.dart';

typedef FailureOrGenreResponse = Future<Either<ServerFailure, GenreResponse>>;
typedef FailureOrMovieResponse = Future<Either<ServerFailure, MovieResponse>>;
typedef FailureOrCreditResponse = Future<Either<ServerFailure, CreditResponse>>;
typedef FailureOrReviewResponse = Future<Either<ServerFailure, ReviewResponse>>;

abstract class MovieRepository {
  /// Get the list of the [Movie] based on the value of [ListCategory]
  /// and [MovieQueries].
  /// Return [Failure] when there's an exception.
  FailureOrMovieResponse getMovies(
    ListCategory category, {
    required MovieQueries requestQuery,
  });

  /// Get the list of the [Movie] based on properties of [SearchQueries].
  /// Return [Failure] when there's an exception.
  FailureOrMovieResponse searchMovie(SearchQueries queries);

  /// Get the list of [Genre].
  /// Return [Failure] when there's an exception.
  FailureOrGenreResponse getGenres();

  /// Get the list of movie [Credit] based on [movieId].
  /// Return [Failure] when there's an exception.
  FailureOrCreditResponse getCredits({required int movieId});

  /// Get the list of movie [Review] based on [movieId].
  /// Return [Failure] when there's an exception.
  FailureOrReviewResponse getReviews(
    int movieId, {
    required ReviewQueries queries,
  });

  /// Get the list of [Movie] based on the value of [GenreQueries]
  /// Return [Failure] when there's an exception.
  FailureOrMovieResponse getMoviesByGenres({required GenreQueries queries});
}
