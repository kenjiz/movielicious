part of 'popular_movies_cubit.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState({
    this.movies = const [],
    this.noMoreData = true,
    this.error,
  });

  final List<Movie> movies;
  final bool noMoreData;
  final ServerFailure? error;

  @override
  List<Object?> get props => [
        movies,
        noMoreData,
        error,
      ];
}

final class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

final class PopularMoviesSuccess extends PopularMoviesState {
  const PopularMoviesSuccess({
    super.movies,
    super.noMoreData,
  });
}

final class PopularMoviesFailed extends PopularMoviesState {
  const PopularMoviesFailed({
    super.error,
  });
}
