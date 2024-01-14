import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/features/genres/domain/models/genre.dart';

class Movie extends Equatable {
  final int id;
  final List<Genre> genres;
  final String backdropPath;
  final String posterPath;
  final String title;
  final String overview;
  final String year;
  final double vote;

  const Movie({
    required this.id,
    required this.genres,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.overview,
    required this.year,
    required this.vote,
  });

  @override
  List<Object> get props {
    return [
      id,
      genres,
      backdropPath,
      posterPath,
      title,
      overview,
      year,
      vote,
    ];
  }

  @override
  bool? get stringify => kDebugMode;
}

extension MovieUtils on Movie {
  /// Get only the year
  String get getYear => year.split('-')[0];

  /// vote
  String get getVote => vote.toStringAsFixed(1);

  /// backdrop
  String get fullBackdropPath => kBaseImagePath + backdropPath;

  /// poster
  String get fullPosterPath => kBaseImagePath + fullBackdropPath;

  /// get genre
  String get genresByName =>
      genres.getRange(0, 1).map((genre) => genre.name).join('/');
}
