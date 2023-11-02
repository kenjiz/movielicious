part of 'top_rated_movies_cubit.dart';

sealed class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState({
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

final class TopRatedMoviesLoading extends TopRatedMoviesState {
  const TopRatedMoviesLoading();
}

final class TopRatedMoviesSuccess extends TopRatedMoviesState {
  const TopRatedMoviesSuccess({
    super.movies,
    super.noMoreData,
  });
}

final class TopRatedMoviesFailed extends TopRatedMoviesState {
  const TopRatedMoviesFailed({
    super.error,
  });
}
