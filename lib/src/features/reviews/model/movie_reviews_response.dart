import 'package:equatable/equatable.dart';

import 'package:movielicious/src/features/reviews/model/review.dart';

class MovieReviewsResponse extends Equatable {
  const MovieReviewsResponse({
    required this.id,
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  final int id;
  final int page;
  final List<Review> results;
  final int totalPages;
  final int totalResults;

  @override
  List<Object> get props {
    return [
      id,
      page,
      results,
      totalPages,
      totalResults,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory MovieReviewsResponse.fromMap(Map<String, dynamic> map) {
    return MovieReviewsResponse(
      id: map['id'] as int,
      page: map['page'] as int,
      results: List<Review>.from(
        (map['results'] as List<dynamic>).map<Review>(
          (x) => Review.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalPages: map['total_pages'] as int,
      totalResults: map['total_results'] as int,
    );
  }

  @override
  bool get stringify => true;
}
