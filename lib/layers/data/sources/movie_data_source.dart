import 'package:movielicious/core/enums/movie_category.dart';
import 'package:movielicious/layers/data/models/movie_model.dart';

abstract class MovieDataSource {
  /// Calls the https://api.themoviedb.org/3/movie/{MovieCategory}?language=en-US&page={page} endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieModel> getMovies({
    required MovieCategory category,
    int page,
  });
}
