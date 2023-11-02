import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/features/credit/data/model/credit_response_model.dart';
import 'package:movielicious/src/features/credit/domain/entity/credit.dart';
import 'package:movielicious/src/features/movies/domain/repository/movie_repositories.dart';
import 'package:movielicious/src/features/credit/domain/usecase/get_credits.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetCredits useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetCredits(repository: mockMovieRepository);
  });

  const tCast = Credit(
    id: 1,
    name: 'name',
    profilePath: 'imagePath',
    character: 'character',
    order: 1,
  );

  const tResponse = CreditResponseModel(id: 1, cast: [tCast]);
  const tMovieId = 1;

  test('should get [CreditResponse] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getCredits(movieId: any(named: 'movieId')))
        .thenAnswer((_) async => const Right(tResponse));

    // Act
    final result = await useCase(tMovieId);

    // Assert
    expect(result, equals(const Right(tResponse)));
    verify(() => mockMovieRepository.getCredits(movieId: tMovieId)).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
