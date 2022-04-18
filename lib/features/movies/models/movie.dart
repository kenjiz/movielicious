
// Packages
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Movie {

  final int id;
  final String title;
  final double rating;
  final String overview;
  final String language;
  final String backdropPath;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.rating,
    required this.overview,
    required this.language,
    required this.backdropPath,
    required this.posterPath,
  });

  String get posterPathURL => '${dotenv.env['BASE_IMAGE_API_URL']}$posterPath';
  String get backdropPathURL => '${dotenv.env['BASE_IMAGE_API_URL']}$backdropPath';

  get getMoviePoster {
    return posterPath.isNotEmpty ? NetworkImage(posterPathURL) : const AssetImage('assets/dummy.jpg');
  }

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      rating: map['vote_average']?.toDouble() ?? 0.0,
      overview: map['overview'] ?? '',
      language: map['original_language'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      posterPath: map['poster_path'] ?? '',
    );
  }

}
