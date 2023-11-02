import '../entity/genre_response.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../movies/domain/repository/movie_repositories.dart';

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
