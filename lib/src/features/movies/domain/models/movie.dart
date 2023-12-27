import 'dart:convert';

class Movie {
  final int id;
  final List<int> genreIds;
  final String backdropPath;
  final String posterPath;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final bool isAdult;

  Movie({
    required this.id,
    required this.genreIds,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.isAdult,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genre_ids': genreIds,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'title': title,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'is_adult': isAdult,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      genreIds: List<int>.from(map['genre_ids']),
      backdropPath: map['backdrop_path'] ?? '',
      posterPath: map['poster_path'] ?? '',
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['release_date'] ?? '',
      voteAverage: map['vote_average'] ?? 0,
      isAdult: map['is_adult'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
