import '../../../movies/domain/repository/movie_repositories.dart';
import '../../../../core/usecases/usecases.dart';
import '../entity/review_queries.dart';
import '../entity/review_response.dart';

class GetReviews implements UseCaseWithTwoParams<ReviewResponse, int, ReviewQueries> {
  final MovieRepository repository;

  const GetReviews({
    required this.repository,
  });

  @override
  FailureOrReviewResponse call(int movieId, ReviewQueries queries) async {
    return await repository.getReviews(movieId, queries: queries);
  }
}
