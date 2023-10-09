import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/layers/data/models/review_model.dart';
import 'package:movielicious/layers/domain/entities/review.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tReviewModel = ReviewModel(
    id: '1',
    author: 'author',
    content: 'content',
    avatarPath: 'avatar_path.jpg',
    rating: '1',
    createdAt: 'created_at',
  );

  test('should be a subclass of [Review] entity', () {
    expect(tReviewModel, isA<Review>());
  });

  group('fromMap', () {
    test('should return a valid model from a map', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> extractedMap =
          json.decode(fixture('review.json'));

      // get onlyu the first index from result
      final testObj = (extractedMap['results'] as List).first;

      final testMap = {
        'id': testObj['id'],
        'author': testObj['author'],
        'content': testObj['content'],
        'avatar_path': testObj['author_details']['avatar_path'],
        'rating': testObj['author_details']['rating'],
        'created_at': testObj['created_at']
      };

      // Act
      final result = ReviewModel.fromMap(testMap);

      // Assert
      expect(result, tReviewModel);
    });
  });

  group('toMap', () {
    const expectedMap = {
      'id': 1,
      'author': 'author',
      'content': 'content',
      'avatar_path': 'avatar_path.jpg',
      'rating': 1,
      'created_at': 'created_at',
    };

    test('should return a proper map from [ReviewModel].', () async {
      // Act
      final result = tReviewModel.toMap();

      // Assert
      expect(result, equals(expectedMap));
    });
  });
}
