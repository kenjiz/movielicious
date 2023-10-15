import 'package:equatable/equatable.dart';

import 'package:movielicious/src/data/models/review_model.dart';

class ReviewResponseModel extends Equatable {
  final int? page;
  final List<ReviewModel> results;
  final int totalPages;
  final int totalResults;

  const ReviewResponseModel({
    this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory ReviewResponseModel.fromMap(Map<String, dynamic> map) {
    return ReviewResponseModel(
      page: map['page'] != null ? map['page'] as int : null,
      results: List<ReviewModel>.from(
        (map['results'] as List).map<ReviewModel>(
          (x) => ReviewModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalPages: map['total_pages'] as int,
      totalResults: map['total_results'] as int,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
