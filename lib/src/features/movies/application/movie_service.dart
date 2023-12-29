import 'package:movielicious/src/features/movies/data/movie_repository.dart';
import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_queries.dart';

class MovieService {
  final MovieRepository _repository;

  MovieService(this._repository);

  FutureEitherMovieResponse getNowPlayingMovies(MovieQueries? queries) {
    return _repository.getMovies(MovieCategory.nowPlaying, queries);
  }

  FutureEitherMovieResponse getUpcomingMovies(MovieQueries? queries) {
    return _repository.getMovies(MovieCategory.upcoming, queries);
  }

  FutureEitherMovieResponse getTopRatedMovies(MovieQueries? queries) {
    return _repository.getMovies(MovieCategory.topRated, queries);
  }

  FutureEitherMovieResponse getPopularMovies(MovieQueries? queries) {
    return _repository.getMovies(MovieCategory.popular, queries);
  }
}
