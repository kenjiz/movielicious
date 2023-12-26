import 'package:movielicious/src/features/genre/data/model/genre_queries_model.dart';
import 'package:movielicious/src/features/genre/domain/entity/genre_queries.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../features/credit/data/model/credit_response_model.dart';
import '../../features/genre/data/model/genre_response_model.dart';
import '../../features/movies/data/models/movie_queries_model.dart';
import '../../features/movies/data/models/movie_response_model.dart';
import '../../features/reviews/data/model/review_queries_model.dart';
import '../../features/reviews/data/model/review_response_model.dart';
import '../../features/search/data/model/search_queries_model.dart';
import '../constants/http_constants.dart';

part 'tmdb_service.g.dart';

@RestApi(baseUrl: kHttpBaseUrl, parser: Parser.MapSerializable)
abstract class TMDBService {
  factory TMDBService(Dio dio, {String baseUrl}) = _TMDBService;

  /// Calls the https://api.themoviedb.org/3/movie/{category} endpoint.
  /// Takes the property value of [MovieQueries] and
  /// returns a [MovieResponseModel].
  /// Throws a [DioException] for all error codes.
  @GET('/movie/{category}')
  Future<MovieResponseModel> getMovies(
    @Path('category') String category, {
    @Queries() required MovieQueriesModel queries,
  });

  /// Calls the https://api.themoviedb.org/3/discover/movie=with_genres{genreIds} endpoint.
  /// Takes the property value of [GenreQueries] and
  /// returns a [MovieResponseModel].
  /// Throws a [DioException] for all error codes.
  @GET('/discover')
  Future<MovieResponseModel> getMoviesByGenres({
    @Queries() required GenreQueriesModel queries,
  });

  /// Calls the https://api.themoviedb.org/3/search/movie?query={params.searchTerm} endpoint.
  /// Takes the value of [SearchQueries] and
  /// returns a [MovieResponseModel].
  /// Throws a [DioException] for all error codes.
  @GET('/search/movie')
  Future<MovieResponseModel> searchMovie({
    @Queries() required SearchQueriesModel queries,
  });

  /// Calls the https://api.themoviedb.org/3/genre/movie/list endpoint.
  /// Returns a [GenreResponseModel].
  /// Throws a [DioException] for all error codes.
  @GET('/genre/movie/list')
  Future<GenreResponseModel> getGenres();

  /// Calls the https://api.themoviedb.org/3/movie/{movieId}/credits endpoint.
  /// Takes a value of the [movieId],
  /// returns a [CreditResponseModel].
  /// Throws a [DioException] for all error codes.
  @GET('/movie/{id}/credits')
  Future<CreditResponseModel> getCredits(@Path('id') int id);

  /// Calls the https://api.themoviedb.org/3/movie/{movieId}/reviews endpoint.
  /// Takes a value of the [movieId] and [ReviewQueriesModel],
  /// returns a [ReviewResponseModel].
  /// Throws a [DioException] for all error codes.
  @GET('/movie/id/reviews')
  Future<ReviewResponseModel> getReviews(
    @Path('id') int id, {
    @Queries() required ReviewQueriesModel queries,
  });
}
