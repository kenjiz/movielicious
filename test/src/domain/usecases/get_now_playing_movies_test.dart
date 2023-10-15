import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/core/enums/list_category.dart';
import 'package:movielicious/src/data/models/request/movie_queries_model.dart';
import 'package:movielicious/src/domain/entities/movie.dart';
import 'package:movielicious/src/domain/repositories/movie_repositories.dart';
import 'package:movielicious/src/domain/usecases/get_now_playing_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetNowPlayingMovies useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetNowPlayingMovies(repository: mockMovieRepository);
  });

  const tMovieRequest = MovieQueriesModel();
  const tMovieCategory = ListCategory.nowPlaying;

  setUpAll(() {
    registerFallbackValue(tMovieCategory);
    registerFallbackValue(tMovieRequest);
  });

  const tMovie = Movie(
    id: 1,
    genreIds: [1, 2, 3],
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
    when(() => mockMovieRepository.getMovies(any(),
            requestQuery: any(named: 'requestQuery')))
        .thenAnswer((_) async => const Right([tMovie]));

    // Act
    final result = await useCase(tMovieRequest);

    // Assert
    expect(result, equals(const Right([tMovie])));
    verify(() => mockMovieRepository.getMovies(
          tMovieCategory,
          requestQuery: tMovieRequest,
        )).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
