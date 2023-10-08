import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/layers/domain/entities/cast.dart';
import 'package:movielicious/layers/domain/repositories/movie_repositories.dart';
import 'package:movielicious/layers/domain/usecases/get_casts.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetCasts useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetCasts(repository: mockMovieRepository);
  });

  const tCast = Cast(
    id: '1',
    name: 'name',
    imagePath: 'imagePath',
    character: 'character',
    order: 1,
  );

  test('should get List of [Cast] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getCasts())
        .thenAnswer((_) async => const Right([tCast]));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(const Right([tCast])));
    verify(() => mockMovieRepository.getCasts()).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
