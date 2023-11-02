import 'package:movielicious/src/core/enums/list_category.dart';
import 'package:movielicious/src/data/models/models.dart';
import 'package:movielicious/src/domain/entities/entities.dart';

import '../../domain/repositories/movie_repositories.dart';
import '../remote/datasource/movie_remote_data_source.dart';
import 'base_api_repository.dart';

class MovieRepositoryImpl extends BaseApiRepository implements MovieRepository {
  final MovieRemoteDataSource _dataSource;
  const MovieRepositoryImpl(this._dataSource);

  @override
  FailureOrCreditResponse getCredits({required int movieId}) {
    return getStateOf<CreditResponseModel>(request: () => _dataSource.getCredits(movieId));
  }

  @override
  FailureOrGenreResponse getGenres() {
    return getStateOf<GenreResponseModel>(request: _dataSource.getGenres);
  }

  @override
  FailureOrMovieResponse getMovies(
    ListCategory category, {
    required MovieQueries requestQuery,
  }) {
    return getStateOf<MovieResponseModel>(
      request: () => _dataSource.getMovies(
        category.keyword,
        queries: requestQuery as MovieQueriesModel,
      ),
    );
  }

  @override
  FailureOrMovieResponse searchMovie(SearchQueries queries) {
    return getStateOf<MovieResponseModel>(request: () => _dataSource.searchMovie(queries as SearchQueriesModel));
  }

  @override
  FailureOrReviewResponse getReviews(
    int movieId, {
    required ReviewQueries queries,
  }) {
    return getStateOf<ReviewResponseModel>(
        request: () => _dataSource.getReviews(
              movieId,
              queries as ReviewQueriesModel,
            ));
  }
}
