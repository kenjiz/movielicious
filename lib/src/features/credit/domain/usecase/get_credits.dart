import '../../../../core/usecases/usecases.dart';
import '../../../movies/domain/repository/movie_repositories.dart';
import '../entity/credit_response.dart';

class GetCredits implements UseCaseWithParams<CreditResponse, int> {
  final MovieRepository repository;

  const GetCredits({required this.repository});

  @override
  FailureOrCreditResponse call(int movieId) async {
    return await repository.getCredits(movieId: movieId);
  }
}
