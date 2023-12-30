part of 'movies_cubit.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object?> get props => [];
}

final class MoviesLoading extends MoviesState {
  const MoviesLoading();
}

final class MoviesLoaded extends MoviesState {
  final List<Movie> movies;
  final int page;
  final int totalPages;
  final int totalResults;

  const MoviesLoaded({
    required this.movies,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object> get props => [
        movies,
        page,
        totalPages,
        totalResults,
      ];
}

final class MoviesFailure extends MoviesState {
  final String message;

  const MoviesFailure(this.message);

  @override
  List<Object> get props => [message];
}
