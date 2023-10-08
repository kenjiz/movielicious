import 'package:dartz/dartz.dart';
import 'package:movielicious/layers/domain/entities/review.dart';

import '../../../core/enums/movie_category.dart';
import '../../../core/errors/failures.dart';
import '../entities/cast.dart';
import '../entities/genre.dart';
import '../entities/movie.dart';

typedef MovieListOrFailure = Future<Either<Failure, List<Movie>>>;
typedef GenreListOrFailure = Future<Either<Failure, List<Genre>>>;
typedef CastListOrFailure = Future<Either<Failure, List<Cast>>>;
typedef ReviewListOrFailure = Future<Either<Failure, List<Review>>>;

abstract class MovieRepository {
  /// Get the list of the [Movie] based on [MovieCategory] as argument.
  /// Return [Failure] when there's an exception.
  MovieListOrFailure getMovies({required MovieCategory category});

  /// Get the list of the [Movie] base on search term.
  /// Return [Failure] when there's an exception.
  MovieListOrFailure searchMovie({required String searchTerm});

  /// Get the list of [Genre].
  /// Return [Failure] when there's an exception.
  GenreListOrFailure getGenres();

  /// Get the list of movie [Cast].
  /// Return [Failure] when there's an exception.
  CastListOrFailure getCasts();

  /// Get the list of movie [Review].
  /// Return [Failure] when there's an exception.
  ReviewListOrFailure getReviews();
}
