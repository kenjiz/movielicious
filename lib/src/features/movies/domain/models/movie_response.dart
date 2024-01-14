import 'dart:convert';

class MovieResponse {
  final int id;
  final List<int> genres;
  final String backdropPath;
  final String posterPath;
  final String title;
  final String overview;
  final String year;
  final double vote;

  MovieResponse({
    required this.id,
    required this.genres,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.overview,
    required this.year,
    required this.vote,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genre_ids': genres,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'title': title,
      'overview': overview,
      'release_date': year,
      'vote_average': vote,
    };
  }

  factory MovieResponse.fromMap(Map<String, dynamic> map) {
    return MovieResponse(
      id: map['id']?.toInt() ?? 0,
      genres: List<int>.from(map['genre_ids']),
      backdropPath: map['backdrop_path'] ?? '',
      posterPath: map['poster_path'] ?? '',
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      year: map['release_date'] ?? '',
      vote: map['vote_average'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieResponse.fromJson(String source) => MovieResponse.fromMap(json.decode(source));
}
