import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/layers/domain/entities/credit.dart';
import 'package:movielicious/layers/domain/repositories/movie_repositories.dart';
import 'package:movielicious/layers/domain/usecases/get_credits.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetCredits useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetCredits(repository: mockMovieRepository);
  });

  const tCast = Credit(
    id: '1',
    name: 'name',
    profilePath: 'imagePath',
    character: 'character',
    order: 1,
  );

  test('should get List of [Cast] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getCredits())
        .thenAnswer((_) async => const Right([tCast]));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(const Right([tCast])));
    verify(() => mockMovieRepository.getCredits()).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
