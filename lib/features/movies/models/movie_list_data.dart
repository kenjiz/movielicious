import 'genre.dart';
import 'movie.dart';

enum MovieCategory { popular, upcoming, bySearch, byTag }

class MovieArgs {
  final MovieCategory category;
  final String? searchKey;
  final Genre? genre;

  MovieArgs({
    required this.category,
    this.searchKey,
    this.genre,
  });

}

class MovieListData {
  final List<Movie> movies;
  final MovieCategory category;
  final String searchKey;
  final int page;
  final Genre? genre;

  MovieListData({
    required this.movies,
    required this.category,
    this.searchKey = '',
    this.page = 1,
    this.genre,
  });

  MovieListData.initial()
      : movies = [],
        category = MovieCategory.popular,
        searchKey = '',
        page = 1,
        genre = null;

  

  MovieListData copyWith({
    List<Movie>? movies,
    MovieCategory? category,
    String? searchKey,
    Genre? genre,
    int? page,
  }) {
    return MovieListData(
      movies: movies ?? this.movies,
      category: category ?? this.category,
      searchKey: searchKey ?? this.searchKey,
      genre: genre ?? this.genre,
      page: page ?? this.page,
    );
  }
}
