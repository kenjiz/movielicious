import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/domain/entities/queries/review_queries.dart';
import 'package:movielicious/src/domain/entities/review.dart';
import 'package:movielicious/src/domain/repositories/movie_repositories.dart';
import 'package:movielicious/src/domain/usecases/get_reviews.dart';

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
      authorDetails: AuthorDetails(
        name: 'name',
        username: 'username',
        avatarPath: 'avatarPath',
        rating: 1,
      ),
      author: 'author',
      content: 'content',
      createdAt: 'createdAt',
    ),
  ];
  const tMovieId = 1;

  test('should get List of [Review] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getReviews(movieId: any(named: 'movieId')))
        .thenAnswer((_) async => const Right(tReviewList));

    // Act
    final result = await useCase(const ReviewQueries(movieId: tMovieId));

    // Assert
    expect(result, equals(const Right(tReviewList)));
    verify(() => mockMovieRepository.getReviews(movieId: tMovieId)).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
