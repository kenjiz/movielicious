import 'package:movielicious/src/features/genre/data/model/genre_queries_model.dart';

import '../../../../../core/service/tmdb_service.dart';
import '../../../../credit/data/model/credit_response_model.dart';
import '../../../../genre/data/model/genre_response_model.dart';
import '../../../../reviews/data/model/review_queries_model.dart';
import '../../../../reviews/data/model/review_response_model.dart';
import '../../../../search/data/model/search_queries_model.dart';
import '../../models/movie_queries_model.dart';
import '../../models/movie_response_model.dart';

import 'movie_remote_data_source.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final TMDBService service;

  const MovieRemoteDataSourceImpl({
    required this.service,
  });

  @override
  Future<MovieResponseModel> getMovies(
    String category, {
    required MovieQueriesModel queries,
  }) async {
    return await service.getMovies(category, queries: queries);
  }

  @override
  Future<CreditResponseModel> getCredits(int movieId) async {
    return await service.getCredits(movieId);
  }

  @override
  Future<GenreResponseModel> getGenres() async {
    return await service.getGenres();
  }

  @override
  Future<MovieResponseModel> searchMovie(SearchQueriesModel queries) async {
    return await service.searchMovie(queries: queries);
  }

  @override
  Future<ReviewResponseModel> getReviews(
    int movieId,
    ReviewQueriesModel queries,
  ) async {
    return await service.getReviews(movieId, queries: queries);
  }

  @override
  Future<MovieResponseModel> getMoviesByGenres(GenreQueriesModel queries) async {
    return await service.getMoviesByGenres(queries: queries);
  }
}
