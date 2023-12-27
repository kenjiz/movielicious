import 'package:fpdart/fpdart.dart';
import 'package:movielicious/src/core/errors/failures.dart';
import 'package:movielicious/src/features/movies/data/source/movie_repository.dart';
import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_queries.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_response.dart';

class MovieService {
  final MovieRepository _repository;

  MovieService(this._repository);

  TaskEither<ServerFailure, MovieResponse> getNowPlayingMovies(MovieQueries? queries) {
    return _repository.getMovies(MovieCategory.nowPlaying, queries);
  }

  TaskEither<ServerFailure, MovieResponse> getUpcomingMovies(MovieQueries? queries) {
    return _repository.getMovies(MovieCategory.upcoming, queries);
  }

  TaskEither<ServerFailure, MovieResponse> getTopRatedMovies(MovieQueries? queries) {
    return _repository.getMovies(MovieCategory.topRated, queries);
  }

  TaskEither<ServerFailure, MovieResponse> getPopularMovies(MovieQueries? queries) {
    return _repository.getMovies(MovieCategory.popular, queries);
  }
}
