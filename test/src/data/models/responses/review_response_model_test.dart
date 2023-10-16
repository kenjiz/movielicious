import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/data/models/models.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = ReviewModel(
    id: '1',
    author: 'author',
    authorDetails: AuthorDetailsModel(
        name: 'name',
        username: 'username',
        avatarPath: 'avatar_path.jpg',
        rating: 1),
    content: 'content',
    createdAt: 'created_at',
  );

  const tResponseModel = ReviewResponseModel(
    page: 1,
    results: [tModel],
    totalPages: 1,
    totalResults: 1,
  );

  group('fromMap', () {
    test('should return a valid model from a json object', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> extractedMap =
          json.decode(fixture('json/review.json'));

      // Act
      final result = ReviewResponseModel.fromMap(extractedMap);

      // Assert
      expect(result, equals(tResponseModel));
    });
  });

  group('toMap', () {
    const expectedMap = {
      'page': 1,
      'results': [
        {
          'author': 'author',
          'author_details': {
            'name': 'name',
            'username': 'username',
            'avatar_path': 'avatar_path.jpg',
            'rating': 1
          },
          'content': 'content',
          'created_at': 'created_at',
          'id': '1',
        }
      ],
      'total_pages': 1,
      'total_results': 1
    };

    test('should return a proper map from [ReviewResponseModel].', () async {
      // Arrange

      // Act
      final result = tResponseModel.toMap();

      // Assert
      expect(result, equals(expectedMap));
    });
  });
}
