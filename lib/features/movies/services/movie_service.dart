// Packages
import 'package:dio/dio.dart';

// Services
import 'http_service.dart';

// Models
import '../models/models.dart';

class MovieService {
  late HTTPService _http;

  MovieService() {
    _http = HTTPService();
  }

  Future<List<Movie>> getMovies({
    required int page,
    required MovieCategory category,
    String? searchKey = '',
    int? genreId,
  }) async {
    late Response _response;
    try {
      switch (category) {
        case MovieCategory.upcoming:
          _response = await _http.get('/movie/upcoming', query: {'page': page});
          break;
        case MovieCategory.byTag:
          if (genreId != null) {
            _response = await _http.get('/discover/movie',
                query: {'page': page, 'with_genres': '$genreId'});
          }
          break;
        case MovieCategory.bySearch:
          _response = await _http
              .get('/search/movie', query: {'page': page, 'query': searchKey});
          break;
        case MovieCategory.popular:
        default:
          _response = await _http.get('/movie/popular', query: {'page': page});
      }
      final List<dynamic> results = _response.data['results'];
      return results.map((data) => Movie.fromJson(data)).toList();
    } catch (e) {
      print(e);
      throw Exception('Cannot fetch movies.');
    }
  }

  Future<List<Movie>> getPopularMovies({required int page}) async {
    Response _response =
        await _http.get('/movie/popular', query: {'page': page});

    if (_response.statusCode == 200) {
      List<dynamic> _data = _response.data['results'];
      List<Movie> _movies =
          _data.map((_data) => Movie.fromJson(_data)).toList();
      return _movies;
    } else {
      throw Exception('Couldn\'t fetch popular movies.');
    }
  }

  Future<List<Movie>> getUpcomingMovies({required int page}) async {
    Response _response =
        await _http.get('/movie/upcoming', query: {'page': page});

    if (_response.statusCode == 200) {
      List<dynamic> _data = _response.data['results'];
      List<Movie> _movies =
          _data.map((_data) => Movie.fromJson(_data)).toList();
      return _movies;
    } else {
      throw Exception('Couldn\'t fetch upcoming movies.');
    }
  }

  Future<Movie> getSingleMovie({required int id}) async {
    try {
      Response _response = await _http.get('/movie/$id');
      final _data = _response.data;
      return Movie.fromJson(_data);
    } catch (e) {
      print(e);
      throw Exception('Couldn\'t fetch the movie with id: $id');
    }
  }

  Future<List<Cast>> getMovieCasts({required int movieId}) async {
    try {
      Response _response = await _http.get('/movie/$movieId/casts');
      final _data = _response.data;
      List<Cast> movieCasts = [];
      if (_data['id'] == movieId) {
        final List<dynamic> casts = _data['cast'];
        movieCasts = casts.map((castData) => Cast.fromJson(castData)).toList();
      }
      return movieCasts.sublist(0, 4);
    } catch (e) {
      print(e);
      throw Exception('Couldn\'t fetch movie casts');
    }
  }

  Future<List<Review>> getMovieReviews({required int movieId}) async {
    try {
      Response _response = await _http.get('/movie/$movieId/reviews');
      final List _data = _response.data['results'];
      List<Review> reviews = [];

      if (_data.isNotEmpty) {
        reviews =
            _data.map((reviewData) => Review.fromJson(reviewData)).toList();
        return reviews;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      throw Exception('Couldn\'t fetch reviews.');
    }
  }
}
