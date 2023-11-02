import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/features/genre/data/model/genre_model.dart';
import 'package:movielicious/src/features/genre/domain/entity/genre.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tGenreModel = GenreModel(
    id: 1,
    name: 'genre_name',
  );

  test('should be a subclass of [Genre] entity', () async {
    // Assert
    expect(tGenreModel, isA<Genre>());
  });

  group('fromMap', () {
    test('should return a valid model from a json object', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> extractedMap = json.decode(fixture('json/genre.json'));

      // get only the first index from result
      final testMap = (extractedMap['genres'] as List).first;

      // Act
      final result = GenreModel.fromMap(testMap);

      // Assert
      expect(result, equals(tGenreModel));
    });
  });

  group('toMap', () {
    const expectedMap = {
      'id': 1,
      'name': 'genre_name',
    };

    test('should return a proper map from [GenreModel]', () async {
      // Act
      final result = tGenreModel.toMap();

      // Assert
      expect(result, equals(expectedMap));
    });
  });
}
