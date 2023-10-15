import 'package:movielicious/src/core/enums/list_category.dart';

import '../entities/movie.dart';
import '../entities/queries/movie_queries.dart';
import '../repositories/movie_repositories.dart';
import '../../core/usecases/usecases.dart';

class GetPopularMovies implements UseCaseWithParams<List<Movie>, MovieQueries> {
  final MovieRepository repository;

  const GetPopularMovies({required this.repository});

  @override
  MovieListOrFailure call(MovieQueries queries) async {
    return await repository.getMovies(
      ListCategory.popular,
      requestQuery: queries,
    );
  }
}
