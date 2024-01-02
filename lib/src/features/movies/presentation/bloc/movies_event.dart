part of 'base_movies_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class MovieListFetched extends MoviesEvent {
  final MovieCategory category;
  final MovieQueries? queries;

  const MovieListFetched({
    required this.category,
    this.queries,
  });
}
