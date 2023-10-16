import '../../../domain/entities/requests/movie_queries.dart';

class MovieQueriesModel extends MovieQueries {
  const MovieQueriesModel({super.page, super.language});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'language': language,
    };
  }

  factory MovieQueriesModel.fromMap(Map<String, dynamic> map) {
    return MovieQueriesModel(
      page: map['page'] != null ? map['page'] as int : null,
      language: map['language'] != null ? map['language'] as String : null,
    );
  }
}
