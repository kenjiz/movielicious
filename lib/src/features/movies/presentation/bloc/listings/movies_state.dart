part of 'base_movies_bloc.dart';

class MoviesState extends Equatable {
  final StateStatus status;
  final List<Movie> movies;
  final int currentPage;
  final bool hasReachedMax;
  final MoviePageError? error;

  const MoviesState({
    this.status = StateStatus.loading,
    this.movies = const <Movie>[],
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.error,
  });

  @override
  List<Object> get props => [status, movies, currentPage, hasReachedMax];

  MoviesState copyWith({
    StateStatus? status,
    List<Movie>? movies,
    int? currentPage,
    bool? hasReachedMax,
    MoviePageError? error,
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
