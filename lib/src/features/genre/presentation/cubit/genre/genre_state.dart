part of 'genre_cubit.dart';

sealed class GenreState extends Equatable {
  final List<Genre> genres;
  final ServerFailure? error;

  const GenreState({
    this.genres = const [],
    this.error,
  });

  @override
  List<Object> get props => [];
}

final class GenreLoading extends GenreState {
  const GenreLoading();
}

final class GenreSuccess extends GenreState {
  const GenreSuccess({
    required this.genres,
  });

  @override
  final List<Genre> genres;
}

final class GenreFailed extends GenreState {
  const GenreFailed({
    super.error,
  });
}
