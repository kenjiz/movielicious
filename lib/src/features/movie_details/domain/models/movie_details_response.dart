import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:movielicious/src/features/genres/domain/models/genre.dart';

class MovieDetailsResponse extends Equatable {
  final int id;
  final String backdropPath;
  final List<Genre> genres;
  final String homepage;
  final String title;
  final String posterPath;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final int runtime;

  const MovieDetailsResponse({
    required this.id,
    required this.backdropPath,
    required this.genres,
    required this.homepage,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
    required this.runtime,
  });

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      genres,
      homepage,
      title,
      posterPath,
      releaseDate,
      overview,
      voteAverage,
      runtime,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'backdrop_path': backdropPath,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'title': title,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'overview': overview,
      'vote_average': voteAverage,
      'runtime': runtime,
    };
  }

  factory MovieDetailsResponse.fromMap(Map<String, dynamic> map) {
    return MovieDetailsResponse(
      id: map['id']?.toInt() ?? 0,
      backdropPath: map['backdrop_path'] ?? '',
      genres: List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x))),
      homepage: map['homepage'] ?? '',
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      overview: map['overview'] ?? '',
      voteAverage: map['vote_average'] ?? 0,
      runtime: map['runtime']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailsResponse.fromJson(String source) => MovieDetailsResponse.fromMap(json.decode(source));
}
