import 'dart:convert';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/features/genres/domain/models/genre.dart';

class MovieWithGenre {
  final int id;
  final List<Genre> genres;
  final String backdropPath;
  final String posterPath;
  final String title;
  final String overview;
  final String year;
  final double vote;

  MovieWithGenre({
    required this.id,
    required this.genres,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.overview,
    required this.year,
    required this.vote,
  });

  /// Get only the year
  String get getYear => year.split('-')[0];

  /// vote
  String get getVote => vote.toStringAsFixed(1);

  /// backdrop
  String get fullBackdropPath => kBaseImagePath + backdropPath;

  /// poster
  String get fullPosterPath => kBaseImagePath + fullBackdropPath;

  /// get genre
  /// TODO: Get actual genre name
  String get genresByName => genres.getRange(0, 1).map((genre) => genre.name).join('/');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genres': genres.map((x) => x.toMap()).toList(),
      'backdropPath': backdropPath,
      'posterPath': posterPath,
      'title': title,
      'overview': overview,
      'year': year,
      'vote': vote,
    };
  }

  factory MovieWithGenre.fromMap(Map<String, dynamic> map) {
    return MovieWithGenre(
      id: map['id']?.toInt() ?? 0,
      genres: List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x))),
      backdropPath: map['backdropPath'] ?? '',
      posterPath: map['posterPath'] ?? '',
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      year: map['year'] ?? '',
      vote: map['vote']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieWithGenre.fromJson(String source) => MovieWithGenre.fromMap(json.decode(source));
}
