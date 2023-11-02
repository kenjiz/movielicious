import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/features/movies/data/models/movie_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_response_model.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = MovieModel(
    id: 1,
    genreIds: [1, 2],
    backdropPath: 'backdrop.jpg',
    posterPath: 'posterpath.jpg',
    title: 'title',
    overview: 'overview',
    releaseDate: '2023-01-01',
    voteAverage: '1.1',
    isAdult: false,
  );

  const tResponseModel = MovieResponseModel(
    page: 1,
    results: [tModel],
    totalPages: 1,
    totalResults: 1,
  );

  group('fromMap', () {
    test('should return a valid model from a json object', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> extractedMap = json.decode(fixture('json/movie.json'));

      // Act
      final result = MovieResponseModel.fromMap(extractedMap);

      // Assert
      expect(result, equals(tResponseModel));
    });
  });

  group('toMap', () {
    const expectedMap = {
      'page': 1,
      'results': [
        {
          'id': 1,
          'genre_ids': [1, 2],
          'backdrop_path': 'backdrop.jpg',
          'poster_path': 'posterpath.jpg',
          'title': 'title',
          'overview': 'overview',
          'release_date': '2023-01-01',
          'vote_average': 1.1,
          'adult': false
        }
      ],
      'total_pages': 1,
      'total_results': 1
    };

    test('should return a proper map from [MovieResponseModel].', () async {
      // Arrange

      // Act
      final result = tResponseModel.toMap();

      // Assert
      expect(result, equals(expectedMap));
    });
  });
}
