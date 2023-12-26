import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movielicious/src/features/movies/presentation/cubits/movies_by_genres/movies_by_genres_cubit.dart';
import 'movies_by_genres_mock.dart';

void main() {
  late GetMoviesByGenresMock usecase;
  late MoviesByGenresCubit cubit;

  setUp(() {
    usecase = GetMoviesByGenresMock();
    cubit = MoviesByGenresCubit(usecase);
  });

  setUpAll(() {
    registerFallbackValue(tGenreQueries);
  });

  blocTest<MoviesByGenresCubit, MoviesByGenresState>(
    'should emit [MoviesByGenresFailed] with error value when fails.',
    build: () => cubit,
    setUp: () {
      when(() => usecase(any())).thenAnswer(
        (_) async => const Left(tError),
      );
    },
    act: (cubit) => cubit.getMoviesByGenres(genre: tGenre),
    expect: () => [
      const MoviesByGenresFailed(error: tError),
    ],
    verify: (_) {
      verify(() => usecase(tGenreQueries)).called(1);
    },
  );

  blocTest<MoviesByGenresCubit, MoviesByGenresState>(
    'should emit [MoviesByGenresSuccess] with list of [Movie] when successful.',
    build: () => cubit,
    setUp: () {
      when(() => usecase(any())).thenAnswer((_) async => const Right(tMovieResponse));
    },
    act: (cubit) => cubit.getMoviesByGenres(genre: tGenre),
    expect: () => [
      const MoviesByGenresSuccess(movies: [tMovie1]),
    ],
    verify: (_) {
      verify(() => usecase(tGenreQueries)).called(1);
    },
  );

  group('pagination', () {
    //TODO: create test for pagination
  });
}
