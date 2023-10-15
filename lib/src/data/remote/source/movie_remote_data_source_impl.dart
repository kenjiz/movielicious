import 'package:movielicious/src/data/models/responses/credit_response.dart';
import 'package:movielicious/src/data/models/responses/genre_response.dart';
import 'package:movielicious/src/data/models/responses/review_response.dart';
import 'package:movielicious/src/domain/entities/queries/search_queries.dart';

import '../../../domain/entities/queries/movie_queries.dart';
import '../../models/responses/movie_response.dart';
import '../service/movie_service.dart';
import 'movie_remote_data_source.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final MovieService service;

  const MovieRemoteDataSourceImpl({
    required this.service,
  });

  @override
  Future<MovieResponseModel> getMovies(
    String category, {
    required MovieQueries queries,
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
  Future<MovieResponseModel> searchMovie(SearchQueries queries) async {
    return await service.searchMovie(queries: queries);
  }

  @override
  Future<ReviewResponseModel> getReviews(int movieId) async {
    return await service.getReviews(movieId);
  }
}
