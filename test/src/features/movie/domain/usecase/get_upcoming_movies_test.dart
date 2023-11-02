import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/core/enums/list_category.dart';
import 'package:movielicious/src/features/movies/data/models/movie_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_queries_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_response_model.dart';
import 'package:movielicious/src/features/movies/domain/repository/movie_repositories.dart';
import 'package:movielicious/src/features/movies/domain/usecase/get_upcoming_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetUpcomingMovies useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetUpcomingMovies(repository: mockMovieRepository);
  });

  const tMovieRequest = MovieQueriesModel();
  const tMovieCategory = ListCategory.upcoming;

  setUpAll(() {
    registerFallbackValue(tMovieCategory);
    registerFallbackValue(tMovieRequest);
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

  test('should get [MovieResponse] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getMovies(any(), requestQuery: any(named: 'requestQuery')))
        .thenAnswer((_) async => const Right(tResponseModel));

    // Act
    final result = await useCase(tMovieRequest);

    // Assert
    expect(result, equals(const Right(tResponseModel)));
    verify(() => mockMovieRepository.getMovies(
          tMovieCategory,
          requestQuery: tMovieRequest,
        )).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
