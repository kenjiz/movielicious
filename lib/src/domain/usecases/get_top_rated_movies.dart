import '../../core/enums/list_category.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/movie_repositories.dart';

class GetTopRatedMovies
    implements UseCaseWithParams<List<Movie>, MovieQueries> {
  final MovieRepository repository;

  const GetTopRatedMovies({required this.repository});

  @override
  MovieListOrFailure call(MovieQueries queries) async {
    return await repository.getMovies(
      ListCategory.topRated,
      requestQuery: queries,
    );
  }
}
