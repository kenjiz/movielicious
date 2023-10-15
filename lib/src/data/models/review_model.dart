import 'package:movielicious/src/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel({
    required String id,
    required String author,
    required AuthorDetailsModel authorDetails,
    required String content,
    required String createdAt,
  }) : super(
          id: id,
          author: author,
          authorDetails: authorDetails,
          content: content,
          createdAt: createdAt,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'author': author,
      'author_details': (authorDetails as AuthorDetailsModel).toMap(),
      'content': content,
      'created_at': createdAt,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: map['id'] as String,
      author: map['author'] as String,
      authorDetails: AuthorDetailsModel.fromMap(
          map['author_details'] as Map<String, dynamic>),
      content: map['content'] as String,
      createdAt: map['created_at'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      author,
      authorDetails,
      content,
      createdAt,
    ];
  }
}

class AuthorDetailsModel extends AuthorDetails {
  const AuthorDetailsModel({
    required String name,
    required String username,
    required String avatarPath,
    required int rating,
  }) : super(
          name: name,
          username: username,
          avatarPath: avatarPath,
          rating: rating,
        );
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'avatar_path': avatarPath,
      'rating': rating,
    };
  }

  factory AuthorDetailsModel.fromMap(Map<String, dynamic> map) =>
      AuthorDetailsModel(
        name: map['name'] as String,
        username: map['username'] as String,
        avatarPath: map['avatar_path'] as String,
        rating: map['rating'] as int,
      );
}
