import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/data/models/models.dart';

void main() {
  const tModel = ReviewQueriesModel(page: 1, language: 'en-US');

  const tMap = {'page': 1, 'language': 'en-US'};

  group('fromMap', () {
    test('should return a valid model from a json object', () async {
      // Act
      final result = ReviewQueriesModel.fromMap(tMap);

      // Assert
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a proper map from [ReviewQueriesModel].', () async {
      // Arrange

      // Act
      final result = tModel.toMap();

      // Assert
      expect(result, equals(tMap));
    });
  });
}
