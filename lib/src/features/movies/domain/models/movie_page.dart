import 'package:equatable/equatable.dart';

import 'package:movielicious/src/features/movies/domain/models/movie.dart';

class MoviePage extends Equatable {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const MoviePage({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
