import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:movielicious/src/features/movies/domain/models/raw_movie.dart';

class MovieResponse extends Equatable {
  final int page;
  final List<RawMovie> results;
  final int totalPages;
  final int totalResults;

  const MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory MovieResponse.fromMap(Map<String, dynamic> map) {
    return MovieResponse(
      page: map['page']?.toInt() ?? 0,
      results: List<RawMovie>.from(map['results']?.map((x) => RawMovie.fromMap(x))),
      totalPages: map['total_pages']?.toInt() ?? 0,
      totalResults: map['total_results']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieResponse.fromJson(String source) => MovieResponse.fromMap(json.decode(source));

  @override
  List<Object> get props => [page, results, totalPages, totalResults];

  @override
  bool? get stringify => kDebugMode;
}
