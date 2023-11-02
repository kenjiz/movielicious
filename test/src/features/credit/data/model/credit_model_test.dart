import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/features/credit/data/model/credit_model.dart';
import 'package:movielicious/src/features/credit/domain/entity/credit.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tCreditModel = CreditModel(
    id: 1,
    name: 'name',
    profilePath: 'profile_path.jpg',
    character: 'character',
    order: 0,
  );

  test('should be a subclass of [Credit] entity', () {
    expect(tCreditModel, isA<Credit>());
  });

  group('fromMap', () {
    test('should return a valid [CreditModel] from a map', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> extractedMap = jsonDecode(fixture('json/credit.json'));

      // get only the first index from result
      final testMap = (extractedMap['cast'] as List).first;

      // Act
      final result = CreditModel.fromMap(testMap);

      // Assert
      expect(result, equals(tCreditModel));
    });
  });

  group('toMap', () {
    const expectedMap = {
      'id': 1,
      'name': 'name',
      'profile_path': 'profile_path.jpg',
      'character': 'character',
      'order': 0
    };

    test('should return a proper map from [CreditModel]', () async {
      // Act
      final result = tCreditModel.toMap();

      // Assert
      expect(result, equals(expectedMap));
    });
  });
}
