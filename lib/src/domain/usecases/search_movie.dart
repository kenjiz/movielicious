import '../entities/entities.dart';
import '../repositories/movie_repositories.dart';
import '../../core/usecases/usecases.dart';

class SearchMovie implements UseCaseWithParams<MovieResponse, SearchQueries> {
  final MovieRepository repository;

  const SearchMovie({
    required this.repository,
  });

  @override
  FailureOrMovieResponse call(SearchQueries params) async {
    return await repository.searchMovie(params);
  }
}
