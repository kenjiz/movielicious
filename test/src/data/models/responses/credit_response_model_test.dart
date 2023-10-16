import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/data/models/models.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = CreditModel(
    id: 1,
    name: 'name',
    profilePath: 'profile_path.jpg',
    character: 'character',
    order: 0,
  );

  const tResponseModel = CreditResponseModel(
    id: 1,
    cast: [tModel],
  );

  group('fromMap', () {
    test('should return a valid model from a json object', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> extractedMap =
          json.decode(fixture('json/credit.json'));

      // Act
      final result = CreditResponseModel.fromMap(extractedMap);

      // Assert
      expect(result, equals(tResponseModel));
    });
  });
}
