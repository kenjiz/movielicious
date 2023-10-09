import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final String author;
  final String avatarPath;
  final String rating;
  final String content;
  final String createdAt;

  const Review({
    required this.id,
    required this.author,
    required this.avatarPath,
    required this.rating,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
        id,
        author,
        avatarPath,
        rating,
        content,
        createdAt,
      ];

  @override
  bool get stringify => true;
}
