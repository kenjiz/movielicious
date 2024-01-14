import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:movielicious/src/core/typdefs/movie_id.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details_response.dart';

import 'package:movielicious/src/features/movies/domain/models/movie_queries.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_response.dart';
import 'package:movielicious/src/core/constants/http_constants.dart';

part 'tmdb_api.g.dart';

@RestApi(baseUrl: kHttpBaseUrl, parser: Parser.MapSerializable)
abstract class TMDBApi {
  factory TMDBApi(Dio dio, {String baseUrl}) = _TMDBApi;

  /// Calls the https://api.themoviedb.org/3/movie/{category} endpoint.
  /// Takes the property value of [MovieQueries] and
  /// returns a [MovieResponse].
  /// Throws a [DioException] for all error codes.
  @GET('/movie/{category}')
  Future<MovieResponse> getMovies(
    @Path('category') String category, {
    @Queries() MovieQueries? queries,
  });

  /// Calls the https://api.themoviedb.org/3/movie/{movieId} endpoint.
  /// Takes the property value of [MovieId] and
  /// returns a [MovieDetailsResponse].
  /// Throws a [DioException] for all error codes.
  @GET('/movie/{movieId}')
  Future<MovieDetailsResponse> getMovieDetails(
    @Path('movieId') MovieId id,
  );

/*
  /// Calls the https://api.themoviedb.org/3/discover/movie=with_genres{genreIds} endpoint.
  /// Takes the property value of [GenreQueries] and
  /// returns a [MovieResponse].
  /// Throws a [DioException] for all error codes.
  @GET('/discover')
  Future<MovieResponse> getMoviesByGenres({
    @Queries() required GenreQueriesModel queries,
  });

  /// Calls the https://api.themoviedb.org/3/search/movie?query={params.searchTerm} endpoint.
  /// Takes the value of [SearchQueries] and
  /// returns a [MovieResponse].
  /// Throws a [DioException] for all error codes.
  @GET('/search/movie')
  Future<MovieResponse> searchMovie({
    @Queries() required SearchQueriesModel queries,
  });
  */

  /*

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
  */
}
