import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/features/search/data/model/search_queries_model.dart';

void main() {
  const tModel = SearchQueriesModel(
    searchTerm: 'search_term',
    page: 1,
    language: 'en-US',
    includeAdult: false,
  );

  const tMap = {'search_term': 'search_term', 'page': 1, 'language': 'en-US', 'include_adult': false};

  group('fromMap', () {
    test('should return a valid model from a json object', () async {
      // Act
      final result = SearchQueriesModel.fromMap(tMap);

      // Assert
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a proper map from [SearchQueriesModel].', () async {
      // Arrange

      // Act
      final result = tModel.toMap();

      // Assert
      expect(result, equals(tMap));
    });
  });
}
