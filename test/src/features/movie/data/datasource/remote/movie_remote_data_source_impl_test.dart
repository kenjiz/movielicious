import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/core/enums/list_category.dart';
import 'package:movielicious/src/core/service/tmdb_service.dart';
import 'package:movielicious/src/features/credit/data/model/credit_response_model.dart';
import 'package:movielicious/src/features/genre/data/model/genre_queries_model.dart';
import 'package:movielicious/src/features/genre/data/model/genre_response_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_queries_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_response_model.dart';
import 'package:movielicious/src/features/movies/data/remote/datasource/movie_remote_data_source_impl.dart';
import 'package:movielicious/src/features/reviews/data/model/review_queries_model.dart';
import 'package:movielicious/src/features/reviews/data/model/review_response_model.dart';
import 'package:movielicious/src/features/search/data/model/search_queries_model.dart';

import '../../../../../../fixtures/fixture_reader.dart';

class MockMovieService extends Mock implements TMDBService {}

void main() {
  late MockMovieService service;
  late MovieRemoteDataSourceImpl datasource;

  setUp(() {
    service = MockMovieService();
    datasource = MovieRemoteDataSourceImpl(service: service);
  });

  group('getMovies', () {
    final tMovieResponse = MovieResponseModel.fromMap(jsonDecode(fixture('json/movie.json')) as Map<String, dynamic>);
    const tMovieQueries = MovieQueriesModel();
    final tCategory = ListCategory.nowPlaying.keyword;

    setUpAll(() {
      registerFallbackValue(tMovieQueries);
    });

    test('should return [MovieResponseModel]', () async {
      // Arrange
      when(() => service.getMovies(any(), queries: any(named: 'queries'))).thenAnswer((_) async => tMovieResponse);

      // Act
      final response = await datasource.getMovies(tCategory, queries: tMovieQueries);

      // Assert
      expect(response, equals(tMovieResponse));
      verify(() => service.getMovies(tCategory, queries: tMovieQueries)).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request', () async {
      // Arrange
      when(() => service.getMovies(any(), queries: any(named: 'queries')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getMovies;

      // Assert
      expect(() => call(tCategory, queries: tMovieQueries), throwsA(isA<DioException>()));
    });
  });

  group('searchMovies', () {
    final tMovieResponse = MovieResponseModel.fromMap(jsonDecode(fixture('json/movie.json')) as Map<String, dynamic>);
    const tSearchQueries = SearchQueriesModel(searchTerm: '');

    setUpAll(() {
      registerFallbackValue(tSearchQueries);
    });

    test('should return [MovieResponseModel]', () async {
      // Arrange
      when(() => service.searchMovie(queries: any(named: 'queries'))).thenAnswer((_) async => tMovieResponse);

      // Act
      final response = await datasource.searchMovie(tSearchQueries);

      // Assert
      expect(response, equals(tMovieResponse));
      verify(() => service.searchMovie(queries: tSearchQueries)).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request', () async {
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
    final tCreditResponse =
        CreditResponseModel.fromMap(jsonDecode(fixture('json/credit.json')) as Map<String, dynamic>);

    const movieId = 1;

    test('should return [CreditResponseModel]', () async {
      // Arrange
      when(() => service.getCredits(any())).thenAnswer((_) async => tCreditResponse);

      // Act
      final response = await datasource.getCredits(movieId);

      // Assert
      expect(response, equals(tCreditResponse));
      verify(() => service.getCredits(movieId)).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request', () async {
      // Arrange
      when(() => service.getCredits(any())).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getCredits;

      // Assert
      expect(() => call(movieId), throwsA(isA<DioException>()));
    });
  });

  group('getGenres', () {
    final tGenreResponse = GenreResponseModel.fromMap(jsonDecode(fixture('json/genre.json')) as Map<String, dynamic>);

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

    test('should return [DioError] when there\'s an error to the request', () async {
      // Arrange
      when(() => service.getGenres()).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getGenres;

      // Assert
      expect(() => call(), throwsA(isA<DioException>()));
    });
  });

  group('getMoviesByGenres', () {
    final tMovieResponse = MovieResponseModel.fromMap(jsonDecode(fixture('json/movie.json')) as Map<String, dynamic>);
    const tGenreQueryModel = GenreQueriesModel(genreIds: [1, 2]);

    setUpAll(() {
      registerFallbackValue(tGenreQueryModel);
    });

    test('should return [MovieResponseModel]', () async {
      // Arrange
      when(() => service.getMoviesByGenres(queries: any(named: 'queries'))).thenAnswer((_) async => tMovieResponse);

      // Act
      final response = await datasource.getMoviesByGenres(tGenreQueryModel);

      // Assert
      expect(response, equals(tMovieResponse));
      verify(() => service.getMoviesByGenres(queries: tGenreQueryModel)).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request', () async {
      // Arrange
      when(() => service.getMoviesByGenres(queries: any(named: 'queries')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getMoviesByGenres;

      // Assert
      expect(() => call(tGenreQueryModel), throwsA(isA<DioException>()));
    });
  });

  group('getReviews', () {
    final tReviewResponseModel =
        ReviewResponseModel.fromMap(jsonDecode(fixture('json/review.json')) as Map<String, dynamic>);

    const movieId = 1;
    const tReviewRequest = ReviewQueriesModel();

    setUpAll(() {
      registerFallbackValue(tReviewRequest);
    });

    test('should return [ReviewResponseModel]', () async {
      // Arrange
      when(() => service.getReviews(any(), queries: any(named: 'queries')))
          .thenAnswer((_) async => tReviewResponseModel);

      // Act
      final response = await datasource.getReviews(movieId, tReviewRequest);

      // Assert
      expect(response, equals(tReviewResponseModel));
      verify(() => service.getReviews(movieId, queries: tReviewRequest)).called(1);
      verifyNoMoreInteractions(service);
    });

    test('should return [DioError] when there\'s an error to the request', () async {
      // Arrange
      when(() => service.getReviews(any(), queries: any(named: 'queries')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final call = datasource.getReviews;

      // Assert
      expect(() => call(movieId, tReviewRequest), throwsA(isA<DioException>()));
    });
  });
}
