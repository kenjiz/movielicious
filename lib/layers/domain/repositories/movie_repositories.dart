import 'package:dartz/dartz.dart';

import '../../../core/enums/movie_category.dart';
import '../../../core/errors/failures.dart';
import '../entities/credit.dart';
import '../entities/genre.dart';
import '../entities/movie.dart';
import '../entities/review.dart';

typedef MovieListOrFailure = Future<Either<Failure, List<Movie>>>;
typedef GenreListOrFailure = Future<Either<Failure, List<Genre>>>;
typedef CreditListOrFailure = Future<Either<Failure, List<Credit>>>;
typedef ReviewListOrFailure = Future<Either<Failure, List<Review>>>;

abstract class MovieRepository {
  /// Get the list of the [Movie] based on category property of [MovieParams].
  /// Return [Failure] when there's an exception.
  MovieListOrFailure getMovies(MovieParams params);

  /// Get the list of the [Movie] based on searchTerm property of [MovieParams].
  /// Return [Failure] when there's an exception.
  MovieListOrFailure searchMovie(MovieParams params);

  /// Get the list of [Genre].
  /// Return [Failure] when there's an exception.
  GenreListOrFailure getGenres();

  /// Get the list of movie [Credit].
  /// Return [Failure] when there's an exception.
  CreditListOrFailure getCredits();

  /// Get the list of movie [Review].
  /// Return [Failure] when there's an exception.
  ReviewListOrFailure getReviews();
}

class MovieParams {
  final MovieCategory? category;
  final String? searchTerm;
  final int page;

  const MovieParams({
    this.category,
    this.searchTerm,
    this.page = 1,
  });
}
