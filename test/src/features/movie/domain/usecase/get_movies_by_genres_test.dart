import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movielicious/src/core/errors/failures.dart';
import 'package:movielicious/src/features/genre/data/model/genre_queries_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_response_model.dart';
import 'package:movielicious/src/features/movies/domain/repository/movie_repositories.dart';
import 'package:movielicious/src/features/movies/domain/usecase/get_movies_by_genres.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

class TModelData {
  const TModelData._();

  static get movie1 => const MovieModel(
        id: 1,
        genreIds: [1, 2],
        backdropPath: 'backdropPath',
        posterPath: 'posterPath',
        title: 'movie1',
        overview: 'overview',
        releaseDate: 'releaseDate',
        voteAverage: 'voteAverage',
        isAdult: false,
      );

  static get movie2 => const MovieModel(
        id: 2,
        genreIds: [1, 3],
        backdropPath: 'backdropPath',
        posterPath: 'posterPath',
        title: 'movie2',
        overview: 'overview',
        releaseDate: 'releaseDate',
        voteAverage: 'voteAverage',
        isAdult: false,
      );

  static get movieResponse => MovieResponseModel(
        page: 1,
        results: [
          TModelData.movie1,
          TModelData.movie2,
        ],
        totalPages: 1,
        totalResults: 2,
      );
}

const tGenreId1 = 1;
const tGenreId2 = 2;

final tMovie1 = TModelData.movie1;
final tMovie2 = TModelData.movie2;

final tDioException = DioException(
  requestOptions: RequestOptions(),
  response: Response(
    requestOptions: RequestOptions(),
    statusCode: 500,
    statusMessage: 'Server Error',
  ),
);

const tGenreQuery = GenreQueriesModel(genreIds: [1, 2]);
final tResponseModel = MovieResponseModel(
  page: 1,
  results: [tMovie1, tMovie2],
  totalPages: 1,
  totalResults: 2,
);

void main() {
  late GetMoviesByGenres useCase;
  late MockMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetMoviesByGenres(repository: repository);
  });

  setUpAll(() {
    registerFallbackValue(tGenreQuery);
  });

  test('should get [MovieResponse] with right data when a list of genre ids is pass as a request.', () async {
    // Arrange
    when(() => repository.getMoviesByGenres(queries: any(named: 'queries')))
        .thenAnswer((_) async => Right(tResponseModel));

    // Act
    final result = await useCase(tGenreQuery);

    // Assert
    expect(result, equals(Right(tResponseModel)));
    verify(() => repository.getMoviesByGenres(queries: tGenreQuery)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return [ServerFailure] when there\'s an error.', () async {
    // Arrange
    when(
      () => repository.getMoviesByGenres(
        queries: any(named: 'queries'),
      ),
    ).thenAnswer(
      (_) async => const Left(
        ServerFailure(
          statusCode: 500,
          statusMessage: 'Failure',
        ),
      ),
    );

    // Act
    final result = await useCase(tGenreQuery);

    // Assert
    expect(result, equals(const Left(ServerFailure(statusCode: 500, statusMessage: 'Failure'))));
    verify(() => repository.getMoviesByGenres(queries: tGenreQuery)).called(1);
  });
}
