import 'package:mocktail/mocktail.dart';
import 'package:movielicious/src/core/errors/failures.dart';
import 'package:movielicious/src/features/genre/data/model/genre_model.dart';
import 'package:movielicious/src/features/genre/data/model/genre_queries_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_model.dart';
import 'package:movielicious/src/features/movies/data/models/movie_response_model.dart';
import 'package:movielicious/src/features/movies/domain/usecase/get_movies_by_genres.dart';

class GetMoviesByGenresMock extends Mock implements GetMoviesByGenres {}

const tGenre = GenreModel(id: 1, name: 'Action');

final tGenreQueries = GenreQueriesModel(
  genreIds: [tGenre.id],
  page: 1,
);

const tError = ServerFailure(
  statusCode: 500,
  statusMessage: 'Error',
);

const tMovie1 = MovieModel(
  id: 1,
  genreIds: [1, 2],
  backdropPath: 'backdropPath',
  posterPath: 'posterPath',
  title: 'title',
  overview: 'overview',
  releaseDate: 'releaseDate',
  voteAverage: 'voteAverage',
  isAdult: false,
);

const tMovieResponse = MovieResponseModel(
  page: 1,
  results: [tMovie1],
  totalPages: 1,
  totalResults: 1,
);
