import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/core/enums/movie_category.dart';
import 'package:movielicious/layers/domain/entities/movie.dart';
import 'package:movielicious/layers/domain/repositories/movie_repositories.dart';
import 'package:movielicious/layers/domain/usecases/get_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetMovies useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetMovies(repository: mockMovieRepository);
  });

  setUpAll(() {
    registerFallbackValue(MovieCategory.popular);
  });

  const tParamsPopular = MovieCategory.popular;
  const tMovie = Movie(
    id: '1',
    genreIds: ['1', '2', '3'],
    backdropPath: 'backdrop.path',
    posterPath: 'poster.path',
    title: 'Test Movie',
    overview: 'Test Overview',
    releaseDate: 'release date',
    voteAverage: '5',
    isAdult: false,
  );

  test('should get List of [Movie] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getMovies(category: any(named: 'category')))
        .thenAnswer((_) async => const Right([tMovie]));

    // Act
    final result = await useCase(tParamsPopular);

    // Assert
    expect(result, equals(const Right([tMovie])));
    verify(() => mockMovieRepository.getMovies(category: tParamsPopular))
        .called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
