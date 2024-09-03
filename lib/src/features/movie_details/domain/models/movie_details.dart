import 'package:equatable/equatable.dart';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/core/typdefs/movie_id.dart';
import 'package:movielicious/src/core/utils/runtime_to_minutes.dart';
import 'package:movielicious/src/features/genres/data/genre_data.dart';
import 'package:movielicious/src/features/genres/domain/models/genre.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details_response.dart';

class MovieDetails extends Equatable {
  final MovieId id;
  final String backdropPath;
  final List<Genre> genres;
  final String homepage;
  final String title;
  final String posterPath;
  final String year;
  final String overview;
  final String voteAverage;
  final String runtime;

  const MovieDetails({
    required this.id,
    required this.backdropPath,
    required this.genres,
    required this.homepage,
    required this.title,
    required this.posterPath,
    required this.year,
    required this.overview,
    required this.voteAverage,
    required this.runtime,
  });

  factory MovieDetails.mapper(MovieDetailsResponse response) {
    return MovieDetails(
      id: response.id,
      backdropPath: kBaseImagePath + response.backdropPath,
      genres: response.genres
          .map((g) => genreList.firstWhere((genre) => g.id == genre.id))
          .toList(),
      homepage: response.homepage,
      title: response.title,
      posterPath: kBaseImagePath + response.posterPath,
      year: response.releaseDate.split('-').first,
      overview: response.overview,
      voteAverage: response.voteAverage.toStringAsFixed(2),
      runtime: runTimeToMinutes(response.runtime),
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      genres,
      homepage,
      title,
      posterPath,
      year,
      overview,
      voteAverage,
      runtime,
    ];
  }
}
