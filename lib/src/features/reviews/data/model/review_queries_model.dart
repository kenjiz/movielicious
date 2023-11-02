import '../../domain/entity/review_queries.dart';

class ReviewQueriesModel extends ReviewQueries {
  const ReviewQueriesModel({
    super.page,
    super.language,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        page,
        language,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'language': language,
    };
  }

  factory ReviewQueriesModel.fromMap(Map<String, dynamic> map) {
    return ReviewQueriesModel(
      page: map['page'] != null ? map['page'] as int : null,
      language: map['language'] != null ? map['language'] as String : null,
    );
  }
}
