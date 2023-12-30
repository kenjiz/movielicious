import 'dart:convert';

import 'package:movielicious/src/features/movies/domain/models/movie_with_genre.dart';

class MoviePage {
  final int page;
  final List<MovieWithGenre> results;
  final int totalPages;
  final int totalResults;

  const MoviePage({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

  factory MoviePage.fromMap(Map<String, dynamic> map) {
    return MoviePage(
      page: map['page']?.toInt() ?? 0,
      results: List<MovieWithGenre>.from(map['results']?.map((x) => MovieWithGenre.fromMap(x))),
      totalPages: map['totalPages']?.toInt() ?? 0,
      totalResults: map['totalResults']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviePage.fromJson(String source) => MoviePage.fromMap(json.decode(source));
}
