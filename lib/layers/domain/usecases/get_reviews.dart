import '../repositories/movie_repositories.dart';
import '../entities/review.dart';
import '../../../core/usecases/usecases.dart';

class GetReviews implements UseCase<List<Review>> {
  final MovieRepository repository;

  const GetReviews({
    required this.repository,
  });

  @override
  ReviewListOrFailure call() async {
    return await repository.getReviews();
  }
}
