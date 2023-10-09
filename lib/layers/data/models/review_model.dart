import 'package:movielicious/layers/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel({
    required String id,
    required String author,
    required String avatarPath,
    required String rating,
    required String content,
    required String createdAt,
  }) : super(
          id: id,
          author: author,
          avatarPath: avatarPath,
          rating: rating,
          content: content,
          createdAt: createdAt,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': int.parse(id),
      'author': author,
      'avatar_path': avatarPath,
      'rating': int.parse(rating),
      'content': content,
      'created_at': createdAt,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) => ReviewModel(
        id: (map['id'] as dynamic).toString(),
        author: map['author'] as String,
        avatarPath: map['avatar_path'] as String,
        rating: (map['rating'] as int).toString(),
        content: map['content'] as String,
        createdAt: map['created_at'] as String,
      );
}
