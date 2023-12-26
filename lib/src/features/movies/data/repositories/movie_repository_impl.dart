import 'package:movielicious/src/core/enums/list_category.dart';
import 'package:movielicious/src/features/genre/data/model/genre_queries_model.dart';
import 'package:movielicious/src/features/genre/domain/entity/genre_queries.dart';

import '../../../credit/data/model/credit_response_model.dart';
import '../../../genre/data/model/genre_response_model.dart';
import '../../../reviews/data/model/review_queries_model.dart';
import '../../../reviews/data/model/review_response_model.dart';
import '../../../reviews/domain/entity/review_queries.dart';
import '../../../search/data/model/search_queries_model.dart';
import '../../../search/domain/entity/search_queries.dart';
import '../../domain/entity/movie_queries.dart';
import '../../domain/repository/movie_repositories.dart';
import '../../../../core/repository/base_api_repository.dart';
import '../models/movie_queries_model.dart';
import '../models/movie_response_model.dart';
import '../remote/datasource/movie_remote_data_source.dart';

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

  @override
  FailureOrMovieResponse getMoviesByGenres({required GenreQueries queries}) {
    return getStateOf<MovieResponseModel>(
      request: () => _dataSource.getMoviesByGenres(queries as GenreQueriesModel),
    );
  }
}
