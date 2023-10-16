import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/movie_repositories.dart';

class GetGenres implements UseCase<GenreResponse> {
  final MovieRepository repository;

  const GetGenres({
    required this.repository,
  });

  @override
  FailureOrGenreResponse call() async {
    return await repository.getGenres();
  }
}
