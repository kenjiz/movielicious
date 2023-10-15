import '../repositories/movie_repositories.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';

class GetReviews implements UseCaseWithParams<List<Review>, ReviewQueries> {
  final MovieRepository repository;

  const GetReviews({
    required this.repository,
  });

  @override
  ReviewListOrFailure call(ReviewQueries params) async {
    return await repository.getReviews(movieId: params.movieId);
  }
}
