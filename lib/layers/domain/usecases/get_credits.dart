import '../../../core/usecases/usecases.dart';
import '../entities/credit.dart';
import '../repositories/movie_repositories.dart';

class GetCredits implements UseCase<List<Credit>> {
  final MovieRepository repository;

  const GetCredits({required this.repository});

  @override
  CreditListOrFailure call() async {
    return await repository.getCredits();
  }
}
