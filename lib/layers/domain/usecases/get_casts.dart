import '../../../core/usecases/usecases.dart';
import '../entities/cast.dart';
import '../repositories/movie_repositories.dart';

class GetCasts implements UseCase<List<Cast>> {
  final MovieRepository repository;

  const GetCasts({required this.repository});

  @override
  CastListOrFailure call() async {
    return await repository.getCasts();
  }
}
