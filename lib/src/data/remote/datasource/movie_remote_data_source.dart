import '../../models/models.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponseModel> getMovies(
    String category, {
    required MovieQueriesModel queries,
  });

  Future<MovieResponseModel> searchMovie(SearchQueriesModel queries);

  Future<CreditResponseModel> getCredits(int movieId);

  Future<GenreResponseModel> getGenres();

  Future<ReviewResponseModel> getReviews(
    int movieId,
    ReviewQueriesModel queries,
  );
}
