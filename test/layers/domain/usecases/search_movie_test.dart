import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/layers/domain/entities/movie.dart';
import 'package:movielicious/layers/domain/repositories/movie_repositories.dart';
import 'package:movielicious/layers/domain/usecases/search_movie.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late SearchMovie useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = SearchMovie(repository: mockMovieRepository);
  });

  setUpAll(() {
    registerFallbackValue('searchTerm');
  });

  const tMovieList = [
    Movie(
      id: '1',
      genreIds: ['1', '2', '3'],
      backdropPath: 'backdrop.path',
      posterPath: 'poster.path',
      title: 'Test Movie',
      overview: 'Test Overview',
      releaseDate: 'release date',
      voteAverage: '5',
      isAdult: false,
    ),
  ];

  const tSearchTerm = 'search term';

  test(
      'should get List of [Movies] from MovieRepository when search has a result',
      () async {
    // Arrange
    when(() => mockMovieRepository.searchMovie(
            searchTerm: any(named: 'searchTerm')))
        .thenAnswer((_) async => const Right(tMovieList));

    // Act
    final result = await useCase(tSearchTerm);

    // Assert
    expect(result, equals(const Right(tMovieList)));
    verify(() => mockMovieRepository.searchMovie(searchTerm: tSearchTerm))
        .called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
