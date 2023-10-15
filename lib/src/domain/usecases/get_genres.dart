import '../entities/genre.dart';
import '../repositories/movie_repositories.dart';
import '../../core/usecases/usecases.dart';

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
