import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/data/models/models.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = GenreModel(id: 1, name: 'genre_name');

  const tResponseModel = GenreResponseModel(
    genres: [tModel],
  );

  group('fromMap', () {
    test('should return a valid model from a json object', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> extractedMap =
          json.decode(fixture('json/genre.json'));

      // Act
      final result = GenreResponseModel.fromMap(extractedMap);

      // Assert
      expect(result, equals(tResponseModel));
    });
  });
}
