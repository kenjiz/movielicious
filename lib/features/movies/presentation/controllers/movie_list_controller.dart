import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/genre.dart';
import '../../models/movie.dart';
import '../../models/movie_list_data.dart';
import '../../services/movie_service.dart';
import '../providers/providers.dart';

class MovieListController extends StateNotifier<MovieListData> {
  final Ref ref;
  late MovieService _repo;
  late MovieArgs args;

  MovieListController(this.ref, this.args, [MovieListData? state])
      : super(state ?? MovieListData.initial()) {
    _repo = ref.read<MovieService>(movieServiceProvider);

    getMovies();

  }


  Future<void> getMovies() async {
    List<Movie> _movies = [];

    switch (args.category) {
    case MovieCategory.upcoming:
      _movies = await _repo.getMovies(
          page: state.page, category: MovieCategory.upcoming);
      break;
    case MovieCategory.byTag:
      _movies = await _repo.getMovies(
          page: state.page,
          category: MovieCategory.byTag,
          genreId: args.genre?.id);
      break;
    case MovieCategory.bySearch:
      _movies = await _repo.getMovies(
          page: state.page,
          category: MovieCategory.bySearch,
          searchKey: args.searchKey);
      break;
    case MovieCategory.popular:
    default:
      _movies = await _repo.getMovies(
          page: state.page, category: MovieCategory.popular);
      break;
  }

    state = state.copyWith(
      movies: [...state.movies, ..._movies],
      page: state.page + 1,
    );
  }
}
