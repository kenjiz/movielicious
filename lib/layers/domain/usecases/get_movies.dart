import '../repositories/movie_repositories.dart';
import '../entities/movie.dart';
import '../../../core/enums/movie_category.dart';
import '../../../core/usecases/usecases.dart';

class GetMovies implements UseCaseWithParams<List<Movie>, MovieCategory> {
  final MovieRepository repository;

  const GetMovies({required this.repository});

  @override
  MovieListOrFailure call(MovieCategory params) async {
    return await repository.getMovies(category: params);
  }
}
