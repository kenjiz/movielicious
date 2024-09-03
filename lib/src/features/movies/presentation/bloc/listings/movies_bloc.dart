import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/listings/base_movies_bloc.dart';

class PopularMoviesBloc extends BaseMoviesBloc {
  PopularMoviesBloc(super.service) {
    add(const MovieListFetched(category: MovieCategory.popular));
  }

  @override
  void fetchNext() {
    next(MovieCategory.popular);
  }
}

class UpcomingMoviesBloc extends BaseMoviesBloc {
  UpcomingMoviesBloc(super.service) {
    add(const MovieListFetched(category: MovieCategory.upcoming));
  }

  @override
  void fetchNext() {
    next(MovieCategory.upcoming);
  }
}

class TopRatedMoviesBloc extends BaseMoviesBloc {
  TopRatedMoviesBloc(super.service) {
    add(const MovieListFetched(category: MovieCategory.topRated));
  }

  @override
  void fetchNext() {
    next(MovieCategory.topRated);
  }
}

class NowPlayingMoviesBloc extends BaseMoviesBloc {
  NowPlayingMoviesBloc(super.service) {
    add(const MovieListFetched(category: MovieCategory.nowPlaying));
  }

  @override
  void fetchNext() {
    next(MovieCategory.nowPlaying);
  }
}
