import '../../core/enums/list_category.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/movie_repositories.dart';

class GetNowPlayingMovies
    implements UseCaseWithParams<List<Movie>, MovieQueries> {
  final MovieRepository repository;

  const GetNowPlayingMovies({required this.repository});

  @override
  MovieListOrFailure call(MovieQueries queries) async {
    return await repository.getMovies(
      ListCategory.nowPlaying,
      requestQuery: queries,
    );
  }
}
