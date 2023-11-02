import '../../../movies/domain/entity/movie_response.dart';
import '../../../movies/domain/repository/movie_repositories.dart';
import '../../../../core/usecases/usecases.dart';
import '../entity/search_queries.dart';

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
