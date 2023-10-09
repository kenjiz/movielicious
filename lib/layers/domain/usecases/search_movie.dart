import '../repositories/movie_repositories.dart';
import '../entities/movie.dart';
import '../../../core/usecases/usecases.dart';

class SearchMovie implements UseCaseWithParams<List<Movie>, MovieParams> {
  final MovieRepository repository;

  const SearchMovie({
    required this.repository,
  });

  @override
  MovieListOrFailure call(MovieParams params) async {
    return await repository.searchMovie(params);
  }
}
