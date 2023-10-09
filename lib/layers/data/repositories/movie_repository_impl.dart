import '../../domain/repositories/movie_repositories.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  MovieListOrFailure getMovies(MovieParams params) {
    // TODO: implement getMovies
    throw UnimplementedError();
  }

  @override
  MovieListOrFailure searchMovie(MovieParams params) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }

  @override
  GenreListOrFailure getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }

  @override
  CreditListOrFailure getCredits() {
    // TODO: implement getCredits
    throw UnimplementedError();
  }

  @override
  ReviewListOrFailure getReviews() {
    // TODO: implement getReviews
    throw UnimplementedError();
  }
}
