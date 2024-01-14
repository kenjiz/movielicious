part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movie,
    this.status = MoviesStateStatus.loading,
    this.error,
  });

  final Movie? movie;
  final MoviesStateStatus status;
  final MoviePageError? error;

  @override
  List<Object?> get props => [
        movie,
        status,
        error,
      ];

  MovieDetailsState copyWith({
    Movie? movie,
    MoviesStateStatus? status,
    MoviePageError? error,
  }) {
    return MovieDetailsState(
      movie: movie ?? this.movie,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
