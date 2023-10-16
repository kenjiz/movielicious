import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/movie_repositories.dart';

class GetCredits implements UseCaseWithParams<CreditResponse, int> {
  final MovieRepository repository;

  const GetCredits({required this.repository});

  @override
  FailureOrCreditResponse call(int movieId) async {
    return await repository.getCredits(movieId: movieId);
  }
}
