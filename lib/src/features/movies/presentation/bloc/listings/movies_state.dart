part of 'base_movies_bloc.dart';

enum MoviesStateStatus {
  loading,
  success,
  failure,
}

class MoviesState extends Equatable {
  final MoviesStateStatus status;
  final List<Movie> movies;
  final int currentPage;
  final bool hasReachedMax;
  final MovieError? error;

  const MoviesState({
    this.status = MoviesStateStatus.loading,
    this.movies = const <Movie>[],
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.error,
  });

  @override
  List<Object> get props => [status, movies, currentPage, hasReachedMax];

  MoviesState copyWith({
    MoviesStateStatus? status,
    List<Movie>? movies,
    int? currentPage,
    bool? hasReachedMax,
    MovieError? error,
  }) {
    return MoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error ?? this.error,
    );
  }

  @override
  bool? get stringify => true;
}
