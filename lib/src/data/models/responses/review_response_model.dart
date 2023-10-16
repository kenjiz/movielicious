import '../../../domain/entities/responses/review_response.dart';
import '../review_model.dart';

class ReviewResponseModel extends ReviewResponse {
  const ReviewResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results.map((x) => (x as ReviewModel).toMap()).toList(),
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
}
