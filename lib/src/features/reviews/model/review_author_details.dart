import 'package:equatable/equatable.dart';

class ReviewAuthorDetails extends Equatable {
  const ReviewAuthorDetails({
    required this.name,
    required this.username,
    required this.rating,
  });

  final String name;
  final String username;
  final double rating;

  @override
  List<Object> get props => [name, username, rating];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'rating': rating,
    };
  }

  factory ReviewAuthorDetails.fromMap(Map<String, dynamic> map) {
    return ReviewAuthorDetails(
      name: map['name'] as String,
      username: map['username'] as String,
      rating: map['rating'] as double,
    );
  }
}
