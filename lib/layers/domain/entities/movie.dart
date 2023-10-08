import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String id;
  final List<String> genreIds;
  final String backdropPath;
  final String posterPath;
  final String title;
  final String overview;
  final String releaseDate;
  final String voteAverage;
  final bool isAdult;

  const Movie({
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

  @override
  List<Object> get props {
    return [
      id,
      genreIds,
      backdropPath,
      posterPath,
      title,
      overview,
      releaseDate,
      voteAverage,
      isAdult,
    ];
  }
}
