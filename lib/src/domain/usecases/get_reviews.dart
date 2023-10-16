import '../repositories/movie_repositories.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';

class GetReviews
    implements UseCaseWithTwoParams<ReviewResponse, int, ReviewQueries> {
  final MovieRepository repository;

  const GetReviews({
    required this.repository,
  });

  @override
  FailureOrReviewResponse call(int movieId, ReviewQueries queries) async {
    return await repository.getReviews(movieId, queries: queries);
  }
}
