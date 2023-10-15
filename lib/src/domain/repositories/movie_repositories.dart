import 'package:dartz/dartz.dart';

import '../../core/enums/list_category.dart';
import '../../core/errors/failures.dart';
import '../entities/entities.dart';

typedef MovieListOrFailure = Future<Either<Failure, List<Movie>>>;
typedef GenreListOrFailure = Future<Either<Failure, List<Genre>>>;
typedef CreditListOrFailure = Future<Either<Failure, List<Credit>>>;
typedef ReviewListOrFailure = Future<Either<Failure, List<Review>>>;

abstract class MovieRepository {
  /// Get the list of the [Movie] based on the value of [ListCategory]
  /// and [MovieQueries].
  /// Return [Failure] when there's an exception.
  MovieListOrFailure getMovies(
    ListCategory category, {
    required MovieQueries requestQuery,
  });

  /// Get the list of the [Movie] based on properties of [SearchQueries].
  /// Return [Failure] when there's an exception.
  MovieListOrFailure searchMovie(SearchQueries params);

  /// Get the list of [Genre].
  /// Return [Failure] when there's an exception.
  GenreListOrFailure getGenres();

  /// Get the list of movie [Credit] based on [movieId].
  /// Return [Failure] when there's an exception.
  CreditListOrFailure getCredits({required int movieId});

  /// Get the list of movie [Review] based on [movieId].
  /// Return [Failure] when there's an exception.
  ReviewListOrFailure getReviews({required int movieId});
}
