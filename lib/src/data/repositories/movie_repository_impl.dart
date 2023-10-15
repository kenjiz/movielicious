import 'package:movielicious/src/core/enums/list_category.dart';

import '../../domain/entities/queries/movie_queries.dart';
import '../../domain/entities/queries/search_queries.dart';
import '../../domain/repositories/movie_repositories.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  CreditListOrFailure getCredits({required int movieId}) {
    // TODO: implement getCredits
    throw UnimplementedError();
  }

  @override
  GenreListOrFailure getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }

  @override
  MovieListOrFailure getMovies(ListCategory category,
      {required MovieQueries requestQuery}) {
    // TODO: implement getMovies
    throw UnimplementedError();
  }

  @override
  ReviewListOrFailure getReviews({required int movieId}) {
    // TODO: implement getReviews
    throw UnimplementedError();
  }

  @override
  MovieListOrFailure searchMovie(SearchQueries params) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }
}
