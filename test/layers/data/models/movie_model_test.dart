import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/layers/data/models/movie_model.dart';
import 'package:movielicious/layers/domain/entities/movie.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tMovieModel = MovieModel(
    id: '1',
    genreIds: ['1', '2'],
    backdropPath: 'backdrop.jpg',
    posterPath: 'posterpath.jpg',
    title: 'title',
    overview: 'overview',
    releaseDate: '2023-01-01',
    voteAverage: '1.1',
    isAdult: false,
  );

  test('should be a subclass of [Movie] entity', () async {
    expect(tMovieModel, isA<Movie>());
  });

  group('fromMap', () {
    test('should return a valid model from a json object', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> dataMap = json.decode(fixture('movie.json'));

      // get only the first index
      final Map<String, dynamic> data = (dataMap['results'] as List).first;

      // Act
      final MovieModel result = MovieModel.fromMap(data);

      // Assert
      expect(result, equals(tMovieModel));
    });
  });

  group('toMap', () {
    const expectedMap = {
      'id': 1,
      'genre_ids': [1, 2],
      'backdrop_path': 'backdrop.jpg',
      'poster_path': 'posterpath.jpg',
      'title': 'title',
      'overview': 'overview',
      'release_date': '2023-01-01',
      'vote_average': 1.1,
      'adult': false,
    };
    test('should return a proper map of [MovieModel].', () async {
      // Arrange

      // Act
      final result = tMovieModel.toMap();

      // Assert
      expect(result, equals(expectedMap));
    });
  });
}
