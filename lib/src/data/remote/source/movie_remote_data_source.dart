import '../../models/responses/credit_response.dart';
import '../../models/responses/genre_response.dart';
import '../../models/responses/movie_response.dart';
import '../../models/responses/review_response.dart';
import '../../../domain/entities/queries/movie_queries.dart';
import '../../../domain/entities/queries/search_queries.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponseModel> getMovies(String category,
      {required MovieQueries queries});

  Future<MovieResponseModel> searchMovie(SearchQueries queries);

  Future<CreditResponseModel> getCredits(int movieId);

  Future<GenreResponseModel> getGenres();

  Future<ReviewResponseModel> getReviews(int movieId);
}
