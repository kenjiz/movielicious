import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/genre_response.dart';

typedef FailureOrGenreResponse = Future<Either<ServerFailure, GenreResponse>>;

abstract class GenreRepository {
  /// Get the list of [Genre].
  /// Return [Failure] when there's an exception.
  FailureOrGenreResponse getGenres();
}
