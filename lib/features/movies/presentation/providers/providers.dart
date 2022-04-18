// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movielicious/features/movies/presentation/controllers/movie_list_controller.dart';

// Services
import '../../services/movie_service.dart';

// Models
import '../../models/models.dart';

// Controller
import '../controllers/movie_data_controller.dart';

// Movie service provider
final movieServiceProvider = Provider<MovieService>((ref) => MovieService());

// Movie data controller provider
final movieDataControllerProvider =
    StateNotifierProvider<MovieDataController, MovieData>(
        (ref) => MovieDataController(ref));

// Genre list provider
final genreProvider = FutureProvider.autoDispose<List<Genre>>((ref) async {
  return await Genre.load();
});

// Single movie data controller provider
final singleMovieDataProvider =
    FutureProvider.autoDispose.family<Movie, int>((ref, movieId) async {
  final _repo = ref.read<MovieService>(movieServiceProvider);
  return await _repo.getSingleMovie(id: movieId);
});

// Get first 4 of the movie castings
final movieCastDataProvider =
    FutureProvider.autoDispose.family<List<Cast>, int>((ref, movieId) async {
  final _repo = ref.read<MovieService>(movieServiceProvider);
  return await _repo.getMovieCasts(movieId: movieId);
});

// the first 4 of the reviews if any
final movieReviewDataProvider =
    FutureProvider.autoDispose.family<List<Review>, int>((ref, movieId) async {
  final _repo = ref.read<MovieService>(movieServiceProvider);
  return await _repo.getMovieReviews(movieId: movieId);
});


final movieListControllerProvider = StateNotifierProvider.autoDispose
    .family<MovieListController, MovieListData, MovieArgs>((ref, args) {
  return MovieListController(ref, args);
});
