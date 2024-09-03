part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.status = StateStatus.loading,
    this.error,
  });

  final MovieDetails? movieDetails;
  final StateStatus status;
  final MovieDetailsError? error;

  @override
  List<Object?> get props => [
        movieDetails,
        status,
        error,
      ];

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    StateStatus? status,
    MovieDetailsError? error,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
