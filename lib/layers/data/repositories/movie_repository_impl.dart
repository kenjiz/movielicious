import 'package:movielicious/core/enums/movie_category.dart';

import '../../domain/repositories/movie_repositories.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  CastListOrFailure getCasts() {
    // TODO: implement getCasts
    throw UnimplementedError();
  }

  @override
  GenreListOrFailure getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }

  @override
  MovieListOrFailure getMovies({required MovieCategory category}) {
    // TODO: implement getMovies
    throw UnimplementedError();
  }

  @override
  ReviewListOrFailure getReviews() {
    // TODO: implement getReviews
    throw UnimplementedError();
  }

  @override
  MovieListOrFailure searchMovie({required String searchTerm}) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }
}
