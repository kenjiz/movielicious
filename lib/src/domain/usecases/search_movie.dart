import '../entities/movie.dart';
import '../entities/queries/search_queries.dart';
import '../repositories/movie_repositories.dart';
import '../../core/usecases/usecases.dart';

class SearchMovie implements UseCaseWithParams<List<Movie>, SearchQueries> {
  final MovieRepository repository;

  const SearchMovie({
    required this.repository,
  });

  @override
  MovieListOrFailure call(SearchQueries params) async {
    return await repository.searchMovie(params);
  }
}
