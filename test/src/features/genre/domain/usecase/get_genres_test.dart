import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/features/genre/data/model/genre_response_model.dart';
import 'package:movielicious/src/features/genre/domain/entity/genre.dart';
import 'package:movielicious/src/features/movies/domain/repository/movie_repositories.dart';
import 'package:movielicious/src/features/genre/domain/usecase/get_genres.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetGenres useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetGenres(repository: mockMovieRepository);
  });

  const tGenreList = [
    Genre(
      id: 1,
      name: 'name',
    ),
  ];

  const tGenreResponse = GenreResponseModel(genres: tGenreList);

  test('should get [GenreResponse] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getGenres()).thenAnswer((_) async => const Right(tGenreResponse));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(const Right(tGenreResponse)));
    verify(() => mockMovieRepository.getGenres()).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
