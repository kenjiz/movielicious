import 'package:equatable/equatable.dart';
import 'package:movielicious/src/features/reviews/model/review_author_details.dart';

class Review extends Equatable {
  const Review({
    required this.id,
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
  });

  final String id;
  final String author;
  final ReviewAuthorDetails authorDetails;
  final String content;
  final DateTime createdAt;

  @override
  List<Object> get props => [id, author, content, createdAt];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'author': author,
      'author_details': authorDetails.toMap(),
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['id'] as String,
      author: map['author'] as String,
      authorDetails: ReviewAuthorDetails.fromMap(
          map['author_details'] as Map<String, dynamic>),
      content: map['content'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}
