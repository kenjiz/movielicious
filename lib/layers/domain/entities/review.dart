import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final String author;
  final String content;
  final String createdAt;

  const Review({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
        id,
        author,
        content,
        createdAt,
      ];

  @override
  bool get stringify => true;
}
