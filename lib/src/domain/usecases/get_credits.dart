import '../entities/credit.dart';
import '../repositories/movie_repositories.dart';
import '../../core/usecases/usecases.dart';

class GetCredits implements UseCaseWithParams<List<Credit>, int> {
  final MovieRepository repository;

  const GetCredits({required this.repository});

  @override
  CreditListOrFailure call(int movieId) async {
    return await repository.getCredits(movieId: movieId);
  }
}
