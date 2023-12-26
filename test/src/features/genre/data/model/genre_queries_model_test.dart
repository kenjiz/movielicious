import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/features/genre/data/model/genre_queries_model.dart';

void main() {
  const tModel = GenreQueriesModel(
    page: 1,
    language: 'en-US',
    genreIds: [1, 2],
  );

  const tMap = {
    'page': 1,
    'language': 'en-US',
    'with_genres': '1|2',
    'sort_by': 'popularity.desc',
  };

  group('toMap', () {
    test('should return a proper map from [GenreQueriesModel].', () async {
      // Arrange

      // Act
      final result = tModel.toMap();

      // Assert
      expect(result, equals(tMap));
    });
  });
}
