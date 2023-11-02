// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  final String createdAt;

  const Review({
    required this.id,
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
        id,
        author,
        authorDetails,
        content,
        createdAt,
      ];

  @override
  bool get stringify => true;
}

class AuthorDetails extends Equatable {
  final String name;
  final String username;
  final String avatarPath;
  final int rating;

  const AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  @override
  List<Object> get props => [
        name,
        username,
        avatarPath,
        rating,
      ];

  @override
  bool get stringify => true;
}
