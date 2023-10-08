import 'dart:convert';

import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required String id,
    required List<String> genreIds,
    required String backdropPath,
    required String posterPath,
    required String title,
    required String overview,
    required String releaseDate,
    required String voteAverage,
    required bool isAdult,
  }) : super(
          id: id,
          genreIds: genreIds,
          backdropPath: backdropPath,
          posterPath: posterPath,
          title: title,
          overview: overview,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          isAdult: isAdult,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': int.parse(id),
      'genre_ids': genreIds.map((v) => int.parse(v)).toList(),
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'title': title,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': double.parse(voteAverage),
      'adult': isAdult,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: (map['id'] as dynamic).toString(),
      genreIds:
          (map['genre_ids'] as List<dynamic>).map((v) => v.toString()).toList(),
      backdropPath: map['backdrop_path'] as String,
      posterPath: map['poster_path'] as String,
      title: map['title'] as String,
      overview: map['overview'] as String,
      releaseDate: map['release_date'] as String,
      voteAverage: (map['vote_average'] as dynamic).toString(),
      isAdult: map['adult'] as bool,
    );
  }
}
