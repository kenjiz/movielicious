import '../../models/movie_queries_model.dart';
import '../../models/movie_response_model.dart';
import '../../../../credit/data/model/credit_response_model.dart';
import '../../../../genre/data/model/genre_response_model.dart';
import '../../../../reviews/data/model/review_queries_model.dart';
import '../../../../reviews/data/model/review_response_model.dart';
import '../../../../search/data/model/search_queries_model.dart';

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
