import 'dart:convert';
import 'package:equatable/equatable.dart';

class ReviewQueries extends Equatable {
  final int movieId;
  final int? page;
  final String? language;

  const ReviewQueries({
    required this.movieId,
    this.page = 1,
    this.language = 'en-US',
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        movieId,
        page,
        language,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'movie_id': movieId,
      'page': page,
      'language': language,
    };
  }

  factory ReviewQueries.fromMap(Map<String, dynamic> map) {
    return ReviewQueries(
      movieId: map['movie_id'] as int,
      page: map['page'] != null ? map['page'] as int : null,
      language: map['language'] != null ? map['language'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewQueries.fromJson(String source) =>
      ReviewQueries.fromMap(json.decode(source) as Map<String, dynamic>);
}
