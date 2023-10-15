import '../../../domain/entities/queries/search_queries.dart';

class SearchQueriesModel extends SearchQueries {
  const SearchQueriesModel({
    required String searchTerm,
    super.language,
    super.page,
    super.includeAdult,
  }) : super(searchTerm: searchTerm);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'searchTerm': searchTerm,
      'language': language,
      'page': page,
      'includeAdult': includeAdult,
    };
  }

  factory SearchQueriesModel.fromMap(Map<String, dynamic> map) {
    return SearchQueriesModel(
      searchTerm: map['search_term'] as String,
      language: map['language'] != null ? map['language'] as String : null,
      page: map['page'] != null ? map['page'] as int : null,
      includeAdult:
          map['include_adult'] != null ? map['include_adult'] as bool : null,
    );
  }
}
