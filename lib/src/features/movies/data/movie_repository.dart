import 'package:fpdart/fpdart.dart';

import 'package:movielicious/src/core/repository/base_api_repository.dart';
import 'package:movielicious/src/core/service/tmdb_api.dart';
import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';
import 'package:movielicious/src/features/genres/data/genre_data.dart';
import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/domain/models/movie.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_page.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_queries.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_response.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_with_genre.dart';

typedef FutureEitherMoviePage = TaskEither<ApiRequestError, MoviePage>;

class MovieRepository extends BaseApiRepository {
  final TMDBApi _api;

  const MovieRepository(this._api);

  FutureEitherMoviePage getMovies(
    MovieCategory category, [
    MovieQueries? queries,
  ]) {
    return processRequest<MovieResponse>(
      request: () => _api.getMovies(category.meta, queries: queries),
    ).flatMap<MoviePage>(_getGenreName);
  }

  FutureEitherMoviePage _getGenreName(MovieResponse response) {
    final List<Movie> movies = response.results;

    final results = movies.map((movie) {
      final genres = movie.genres.map((genreId) => genreList.firstWhere((genre) => genre.id == genreId)).toList();

      return MovieWithGenre(
        id: movie.id,
        genres: genres,
        backdropPath: movie.backdropPath,
        posterPath: movie.posterPath,
        title: movie.title,
        overview: movie.overview,
        year: movie.year,
        vote: movie.vote,
      );
    }).toList();

    return TaskEither.of(MoviePage(
      page: response.page,
      results: results,
      totalPages: response.totalPages,
      totalResults: response.totalResults,
    ));
  }
}
