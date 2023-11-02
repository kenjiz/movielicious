import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/features/reviews/data/model/review_model.dart';
import 'package:movielicious/src/features/reviews/domain/entity/review.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tAuthorDetails = AuthorDetailsModel(
    name: 'name',
    username: 'username',
    avatarPath: 'avatar_path.jpg',
    rating: 1,
  );

  const tReviewModel = ReviewModel(
    id: '1',
    author: 'author',
    authorDetails: tAuthorDetails,
    content: 'content',
    createdAt: 'created_at',
  );

  test('should be a subclass of [Review] entity', () {
    expect(tReviewModel, isA<Review>());
  });

  group('fromMap', () {
    test('should return a valid model from a map', () async {
      // Arrange

      // decode json file
      final Map<String, dynamic> extractedMap = json.decode(fixture('json/review.json'));

      // get onlyu the first index from result
      final testObj = (extractedMap['results'] as List).first;

      final testMap = {
        'id': testObj['id'],
        'author': testObj['author'],
        'author_details': testObj['author_details'],
        'content': testObj['content'],
        'created_at': testObj['created_at']
      };

      // Act
      final result = ReviewModel.fromMap(testMap);

      // Assert
      expect(result, tReviewModel);
    });
  });

  group('toMap', () {
    final expectedMap = {
      'id': '1',
      'author': 'author',
      'author_details': tAuthorDetails.toMap(),
      'content': 'content',
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
