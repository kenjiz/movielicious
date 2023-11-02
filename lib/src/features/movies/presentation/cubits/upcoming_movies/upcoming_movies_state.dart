part of 'upcoming_movies_cubit.dart';

sealed class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState({
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

final class UpcomingMoviesLoading extends UpcomingMoviesState {
  const UpcomingMoviesLoading();
}

final class UpcomingMoviesSuccess extends UpcomingMoviesState {
  const UpcomingMoviesSuccess({
    super.movies,
    super.noMoreData,
  });
}

final class UpcomingMoviesFailed extends UpcomingMoviesState {
  const UpcomingMoviesFailed({
    super.error,
  });
}
