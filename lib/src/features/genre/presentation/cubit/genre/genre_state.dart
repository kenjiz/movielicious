part of 'genre_cubit.dart';

sealed class GenreState extends Equatable {
  const GenreState();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [];
}

final class GenreLoading extends GenreState {
  const GenreLoading();
}

final class GenreSuccess extends GenreState {
  final List<Genre> genres;

  const GenreSuccess({
    required this.genres,
  });

  @override
  List<Object> get props => [genres];
}

final class GenreFailed extends GenreState {
  final ServerFailure error;

  const GenreFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
