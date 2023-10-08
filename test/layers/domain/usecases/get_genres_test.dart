import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/layers/domain/entities/genre.dart';
import 'package:movielicious/layers/domain/repositories/movie_repositories.dart';
import 'package:movielicious/layers/domain/usecases/get_genres.dart';

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
      id: 'id',
      name: 'name',
    ),
  ];

  test('should get List of [Genre] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getGenres())
        .thenAnswer((_) async => const Right(tGenreList));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(const Right(tGenreList)));
    verify(() => mockMovieRepository.getGenres()).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
