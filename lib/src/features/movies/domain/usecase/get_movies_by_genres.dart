import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../genre/domain/entity/genre_queries.dart';
import '../entity/movie_response.dart';
import '../repository/movie_repositories.dart';

class GetMoviesByGenres implements UseCaseWithParams<MovieResponse, GenreQueries> {
  final MovieRepository repository;

  GetMoviesByGenres({
    required this.repository,
  });
  @override
  Future<Either<ServerFailure, MovieResponse>> call(GenreQueries queries) async {
    return await repository.getMoviesByGenres(queries: queries);
  }
}
