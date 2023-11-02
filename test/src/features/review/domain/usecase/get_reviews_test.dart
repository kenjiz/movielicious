import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/features/movies/domain/repository/movie_repositories.dart';
import 'package:movielicious/src/features/reviews/data/model/review_model.dart';
import 'package:movielicious/src/features/reviews/data/model/review_queries_model.dart';
import 'package:movielicious/src/features/reviews/data/model/review_response_model.dart';
import 'package:movielicious/src/features/reviews/domain/usecase/get_reviews.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetReviews useCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetReviews(repository: mockMovieRepository);
  });

  setUpAll(() {
    registerFallbackValue(const ReviewQueriesModel());
  });

  const tModel = ReviewModel(
    id: '1',
    author: 'author',
    authorDetails: AuthorDetailsModel(name: 'name', username: 'username', avatarPath: 'avatar_path.jpg', rating: 1),
    content: 'content',
    createdAt: 'created_at',
  );

  const tResponseModel = ReviewResponseModel(
    page: 1,
    results: [tModel],
    totalPages: 1,
    totalResults: 1,
  );

  const tQueries = ReviewQueriesModel();

  const tMovieId = 1;

  test('should get List of [Review] from MovieRepository', () async {
    // Arrange
    when(() => mockMovieRepository.getReviews(any(), queries: any(named: 'queries')))
        .thenAnswer((_) async => const Right(tResponseModel));

    // Act
    final result = await useCase(tMovieId, tQueries);

    // Assert
    expect(result, equals(const Right(tResponseModel)));
    verify(() => mockMovieRepository.getReviews(tMovieId, queries: tQueries)).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
