import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constants/http_constants.dart';
import '../../models/responses/credit_response.dart';
import '../../models/responses/genre_response.dart';
import '../../models/responses/movie_response.dart';
import '../../models/responses/review_response.dart';
import '../../../domain/entities/queries/movie_queries.dart';
import '../../../domain/entities/queries/search_queries.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: kHttpBaseUrl, parser: Parser.MapSerializable)
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  /// Calls the https://api.themoviedb.org/3/movie/{params.category} endpoint.
  /// Takes the property value of [MovieQueries] and
  /// returns a [MovieResponseModel].
  /// Throws a [ServerException] for all error codes.
  @GET('/movie/{category}')
  Future<MovieResponseModel> getMovies(
    @Path('category') String category, {
    @Queries() required MovieQueries queries,
  });

  /// Calls the https://api.themoviedb.org/3/search/movie?query={params.searchTerm} endpoint.
  /// Takes the property value of [SearchQueries] and
  /// returns a [MovieResponseModel].
  /// Throws a [ServerException] for all error codes.
  @GET('/search/movie')
  Future<MovieResponseModel> searchMovie({
    @Queries() required SearchQueries queries,
  });

  /// Calls the https://api.themoviedb.org/3/genre/movie/list endpoint.
  /// Returns a [GenreResponseModel].
  /// Throws a [ServerException] for all error codes.
  @GET('/genre/movie/list')
  Future<GenreResponseModel> getGenres();

  /// Calls the https://api.themoviedb.org/3/movie/{movieId}/credits endpoint.
  /// Takes a string representation of the [movieId] and
  /// returns a [CreditResponseModel].
  /// Throws a [ServerException] for all error codes.
  @GET('/movie/{id}/credits')
  Future<CreditResponseModel> getCredits(@Path('id') int id);

  /// Calls the https://api.themoviedb.org/3/movie/{movieId}/reviews endpoint.
  /// Takes a string representation of the [movieId] and
  /// returns a [ReviewResponseModel].
  /// Throws a [ServerException] for all error codes.
  @GET('/movie/id/reviews')
  Future<ReviewResponseModel> getReviews(@Path('id') int id);
}
