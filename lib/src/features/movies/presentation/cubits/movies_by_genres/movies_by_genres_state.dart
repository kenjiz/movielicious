part of 'movies_by_genres_cubit.dart';

sealed class MoviesByGenresState extends Equatable {
  const MoviesByGenresState({
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

final class MoviesByGenresLoading extends MoviesByGenresState {
  const MoviesByGenresLoading();
}

final class MoviesByGenresSuccess extends MoviesByGenresState {
  const MoviesByGenresSuccess({
    super.movies,
    super.noMoreData,
  });
}

final class MoviesByGenresFailed extends MoviesByGenresState {
  const MoviesByGenresFailed({
    super.error,
  });
}
