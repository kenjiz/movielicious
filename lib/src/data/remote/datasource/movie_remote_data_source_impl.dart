import '../../models/models.dart';
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
}
