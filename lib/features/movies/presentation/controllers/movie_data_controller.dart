// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Models
import '../../models/models.dart';

// Providers
import '../../services/movie_service.dart';
import '../providers/providers.dart';

enum ListingType { upcoming, popular }

class MovieDataController extends StateNotifier<MovieData> {
  final Ref ref;

  late MovieService _repo;

  MovieDataController(this.ref, [MovieData? state])
      : super(state ?? MovieData.initial()) {
    _repo = ref.read<MovieService>(movieServiceProvider);
    getMovies();
  }
  

  Future<void> getMovies() async {
    try {
      List<Movie> _popularMovies = [];
      List<Movie> _upcomingMovies = [];

      _popularMovies = await _repo.getPopularMovies(page: state.page + 1);
      _upcomingMovies = await _repo.getUpcomingMovies(page: state.page + 1);


      state = state.copyWith(
        posterImage: _popularMovies[0].getMoviePoster,
        popularMovies: [...state.popularMovies, ..._popularMovies],
        upcomingMovies: [...state.upcomingMovies, ..._upcomingMovies],
        page: state.page + 1,
      );

    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

}
