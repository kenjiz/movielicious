import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/core/service/tmdb_api.dart';
import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';
import 'package:movielicious/src/features/genres/domain/models/genre.dart';
import 'package:movielicious/src/features/movie_details/data/movie_details_repository.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details_error.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details_response.dart';

const basePath = 'test/src/features/movie_details/domain/models';

class MockApi extends Mock implements TMDBApi {}

void main() {
  final tJsonString = File('$basePath/fixtures/movie_details_response.json').readAsStringSync();
  final tResponse = MovieDetailsResponse.fromJson(tJsonString);

  const tError = ApiRequestError(error: 'exception');

  const expResult = MovieDetails(
    id: 1,
    backdropPath: '${kBaseImagePath}backdrop_path',
    genres: [Genre(id: 28, name: 'Action')],
    homepage: 'homepage',
    title: 'title',
    posterPath: '${kBaseImagePath}poster_path',
    year: '2023',
    overview: 'overview',
    voteAverage: '1',
    runtime: '1h 59m',
  );

  late MockApi tApi;
  late MovieDetailsRepository repository;

  setUp(() {
    tApi = MockApi();
    repository = MovieDetailsRepository(tApi);
  });

  test('should get MovieDetails object when successful.', () async {
    when(() => tApi.getMovieDetails(any())).thenAnswer((_) async => tResponse);
    final result = await repository.getMovieDetails(1).run();

    expect(result, const Right(expResult));
    expect(result, isA<Right<dynamic, MovieDetails>>());
  });

  test('should throw MovieDetailsError when failed', () async {
    when(() => tApi.getMovieDetails(any())).thenThrow(tError);
    final result = await repository.getMovieDetails(1).run();

    expect(result, isA<Left<MovieDetailsError, dynamic>>());
  });
}
