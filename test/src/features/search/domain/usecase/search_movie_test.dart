import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/features/movies/data/models/movie_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_response_model.dart';
import 'package:movielicious/src/features/movies/domain/repository/movie_repositories.dart';
import 'package:movielicious/src/features/search/data/model/search_queries_model.dart';
import 'package:movielicious/src/features/search/domain/usecase/search_movie.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late SearchMovie useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = SearchMovie(repository: mockMovieRepository);
  });

  const tMovie = MovieModel(
    id: 1,
    genreIds: [1, 2],
    backdropPath: 'backdrop.jpg',
    posterPath: 'posterpath.jpg',
    title: 'title',
    overview: 'overview',
    releaseDate: '2023-01-01',
    voteAverage: '1.1',
    isAdult: false,
  );

  const tResponseModel = MovieResponseModel(
    page: 1,
    results: [tMovie],
    totalPages: 1,
    totalResults: 1,
  );

  const tSearchRequest = SearchQueriesModel(searchTerm: 'searchTerm');

  setUpAll(() {
    registerFallbackValue(tSearchRequest);
  });

  test('should get List of [Movies] from MovieRepository when search has a result', () async {
    // Arrange
    when(() => mockMovieRepository.searchMovie(any())).thenAnswer((_) async => const Right(tResponseModel));

    // Act
    final result = await useCase(tSearchRequest);

    // Assert
    expect(result, equals(const Right(tResponseModel)));
    verify(() => mockMovieRepository.searchMovie(tSearchRequest)).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
