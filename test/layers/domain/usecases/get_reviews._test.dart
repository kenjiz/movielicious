import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/layers/domain/entities/review.dart';
import 'package:movielicious/layers/domain/repositories/movie_repositories.dart';
import 'package:movielicious/layers/domain/usecases/get_reviews.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetReviews useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetReviews(repository: mockMovieRepository);
  });

  const tReviewList = [
    Review(
      id: 'id',
      author: 'author',
      content: 'content',
      createdAt: 'createdAt',
    ),
  ];

  test('should get List of [Review] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getReviews())
        .thenAnswer((_) async => const Right(tReviewList));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(const Right(tReviewList)));
    verify(() => mockMovieRepository.getReviews()).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
