import '../../../core/usecases/usecases.dart';
import '../entities/genre.dart';
import '../repositories/movie_repositories.dart';

class GetGenres implements UseCase<List<Genre>> {
  final MovieRepository repository;

  const GetGenres({
    required this.repository,
  });

  @override
  GenreListOrFailure call() async {
    return await repository.getGenres();
  }
}
