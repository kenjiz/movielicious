import '../../../domain/entities/queries/review_queries.dart';

class ReviewQueriesModel extends ReviewQueries {
  const ReviewQueriesModel({
    required int movieId,
    super.page,
    super.language,
  }) : super(movieId: movieId);

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

  factory ReviewQueriesModel.fromMap(Map<String, dynamic> map) {
    return ReviewQueriesModel(
      movieId: map['movie_id'] as int,
      page: map['page'] != null ? map['page'] as int : null,
      language: map['language'] != null ? map['language'] as String : null,
    );
  }
}
