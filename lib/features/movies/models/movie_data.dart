// Packages
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Models
import './movie.dart';

class MovieData {
  final dynamic posterImage;
  final List<Movie> popularMovies;
  final List<Movie> upcomingMovies;
  final int page;

  MovieData({
    required this.posterImage,
    required this.popularMovies,
    required this.upcomingMovies,
    required this.page,
  });

  MovieData.initial()
      : posterImage = AssetImage('assets/dummy.jpg'),
        popularMovies = [],
        upcomingMovies = [],
        page = 1;

  MovieData copyWith({
    dynamic posterImage,
    List<Movie>? popularMovies,
    List<Movie>? upcomingMovies,
    int? page,
  }) {
    return MovieData(
      posterImage: posterImage ?? this.posterImage,
      popularMovies: popularMovies ?? this.popularMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      page: page ?? this.page,
    );
  }
}
