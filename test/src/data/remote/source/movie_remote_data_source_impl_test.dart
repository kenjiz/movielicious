import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/core/enums/list_category.dart';
import 'package:movielicious/src/data/models/responses/credit_response.dart';
import 'package:movielicious/src/data/models/responses/genre_response.dart';
import 'package:movielicious/src/data/models/responses/movie_response.dart';
import 'package:movielicious/src/data/models/responses/review_response.dart';
import 'package:movielicious/src/data/remote/service/movie_service.dart';
import 'package:movielicious/src/data/remote/source/movie_remote_data_source_impl.dart';
import 'package:movielicious/src/domain/entities/queries/movie_queries.dart';
import 'package:movielicious/src/domain/entities/queries/search_queries.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockMovieService extends Mock implements MovieService {}

void main() {
  late MockMovieService service;
  late MovieRemoteDataSourceImpl datasource;

  setUp(() {
    service = MockMovieService();
    datasource = MovieRemoteDataSourceImpl(service: service);
  });

  group('getMovies', () {
    final tMovieResponse = MovieResponseModel.fromMap(
        jsonDecode(fixture('json/movie.json')) as Map<String, dynamic>);
    const tMovieQueries = MovieQueries();
    final tCategory = ListCategory.nowPlaying.keyword;

    setUpAll(() {
      registerFallbackValue(tMovieQueries);
    });

    test('should return [MovieResponseModel]', () async {
      // Arrange
      when(() => service.getMovies(any(), queries: any(named: 'queries')))
          .thenAnswer((_) async => tMovieResponse);

      // Act
      final response =
          await datasource.getMovies(tCategory, queries: tMovieQueries);

      // Assert
      expect(response, equals(tMovieResponse));
      verify(() => service.getMovies(tCategory, queries: tMovieQueries))
          .called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request',
        () async {
      // Arrange
      when(() => service.getMovies(any(), queries: any(named: 'queries')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getMovies;

      // Assert
      expect(() => call(tCategory, queries: tMovieQueries),
          throwsA(isA<DioException>()));
    });
  });

  group('searchMovies', () {
    final tMovieResponse = MovieResponseModel.fromMap(
        jsonDecode(fixture('json/movie.json')) as Map<String, dynamic>);
    const tSearchQueries = SearchQueries(searchTerm: '');

    setUpAll(() {
      registerFallbackValue(tSearchQueries);
    });

    test('should return [MovieResponseModel]', () async {
      // Arrange
      when(() => service.searchMovie(queries: any(named: 'queries')))
          .thenAnswer((_) async => tMovieResponse);

      // Act
      final response = await datasource.searchMovie(tSearchQueries);

      // Assert
      expect(response, equals(tMovieResponse));
      verify(() => service.searchMovie(queries: tSearchQueries)).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request',
        () async {
      // Arrange
      when(() => service.searchMovie(queries: any(named: 'queries')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.searchMovie;

      // Assert
      expect(() => call(tSearchQueries), throwsA(isA<DioException>()));
    });
  });

  group('getCredits', () {
    final tCreditResponse = CreditResponseModel.fromMap(
        jsonDecode(fixture('json/credit.json')) as Map<String, dynamic>);

    const movieId = 1;

    test('should return [CreditResponseModel]', () async {
      // Arrange
      when(() => service.getCredits(any()))
          .thenAnswer((_) async => tCreditResponse);

      // Act
      final response = await datasource.getCredits(movieId);

      // Assert
      expect(response, equals(tCreditResponse));
      verify(() => service.getCredits(movieId)).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request',
        () async {
      // Arrange
      when(() => service.getCredits(any()))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getCredits;

      // Assert
      expect(() => call(movieId), throwsA(isA<DioException>()));
    });
  });

  group('getGenres', () {
    final tGenreResponse = GenreResponseModel.fromMap(
        jsonDecode(fixture('json/genre.json')) as Map<String, dynamic>);

    test('should return [GenreResponseModel]', () async {
      // Arrange
      when(() => service.getGenres()).thenAnswer((_) async => tGenreResponse);

      // Act
      final response = await datasource.getGenres();

      // Assert
      expect(response, equals(tGenreResponse));
      verify(() => service.getGenres()).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request',
        () async {
      // Arrange
      when(() => service.getGenres())
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getGenres;

      // Assert
      expect(() => call(), throwsA(isA<DioException>()));
    });
  });

  group('getReviews', () {
    final tReviewResponseModel = ReviewResponseModel.fromMap(
        jsonDecode(fixture('json/review.json')) as Map<String, dynamic>);

    const movieId = 1;

    test('should return [ReviewResponseModel]', () async {
      // Arrange
      when(() => service.getReviews(any()))
          .thenAnswer((_) async => tReviewResponseModel);

      // Act
      final response = await datasource.getReviews(1);

      // Assert
      expect(response, equals(tReviewResponseModel));
      verify(() => service.getReviews(movieId)).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request',
        () async {
      // Arrange
      when(() => service.getReviews(any()))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getReviews;

      // Assert
      expect(() => call(movieId), throwsA(isA<DioException>()));
    });
  });
}
