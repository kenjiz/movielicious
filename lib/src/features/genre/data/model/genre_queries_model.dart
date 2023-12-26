import 'package:movielicious/src/features/genre/domain/entity/genre_queries.dart';

class GenreQueriesModel extends GenreQueries {
  const GenreQueriesModel({
    required super.genreIds,
    super.page,
    super.language,
    super.sort,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'with_genres': genreIds.join('|'),
      'page': page,
      'language': language,
      'sort_by': sort.name
    };
  }
}
