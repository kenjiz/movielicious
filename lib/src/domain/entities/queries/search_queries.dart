import 'dart:convert';
import 'package:equatable/equatable.dart';

class SearchQueries extends Equatable {
  final String? searchTerm;
  final String? language;
  final int? page;
  final bool? includeAdult;

  const SearchQueries({
    this.searchTerm = '',
    this.language = 'en-US',
    this.page = 1,
    this.includeAdult = false,
  });

  @override
  List<Object?> get props => [
        searchTerm,
        language,
        page,
        includeAdult,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'searchTerm': searchTerm,
      'language': language,
      'page': page,
      'includeAdult': includeAdult,
    };
  }

  factory SearchQueries.fromMap(Map<String, dynamic> map) {
    return SearchQueries(
      searchTerm:
          map['search_term'] != null ? map['search_term'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      page: map['page'] != null ? map['page'] as int : null,
      includeAdult:
          map['include_adult'] != null ? map['include_adult'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchQueries.fromJson(String source) =>
      SearchQueries.fromMap(json.decode(source) as Map<String, dynamic>);
}
