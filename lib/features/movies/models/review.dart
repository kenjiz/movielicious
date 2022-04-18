// Packages
import 'package:intl/intl.dart';

class Review {
  final String id;
  final String author;
  final String content;
  final String createdAt;

  Review({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
  });

  String get createdDate => DateFormat.yMEd().format(DateTime.parse(createdAt));

  factory Review.fromJson(Map<String, dynamic> map) {
    return Review(
      id: map['id'] ?? 0,
      author: map['author'] ?? '',
      content: map['content'] ?? '',
      createdAt: map['created_at'] ?? '',
    );
  }
}
