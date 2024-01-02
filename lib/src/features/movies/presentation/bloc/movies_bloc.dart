import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/base_movies_bloc.dart';

class PopularMoviesBloc extends BaseMoviesBloc {
  PopularMoviesBloc(super.service) {
    add(const MovieListFetched(category: MovieCategory.popular));
  }

  void fetchNext() {
    next(MovieCategory.popular);
  }
}

class UpcomingMoviesBloc extends BaseMoviesBloc {
  UpcomingMoviesBloc(super.service) {
    add(const MovieListFetched(category: MovieCategory.upcoming));
  }

  void fetchNext() {
    next(MovieCategory.upcoming);
  }
}

class TopRatedMoviesBloc extends BaseMoviesBloc {
  TopRatedMoviesBloc(super.service) {
    add(const MovieListFetched(category: MovieCategory.topRated));
  }

  void fetchNext() {
    next(MovieCategory.topRated);
  }
}

class NowPlayingMoviesBloc extends BaseMoviesBloc {
  NowPlayingMoviesBloc(super.service) {
    add(const MovieListFetched(category: MovieCategory.nowPlaying));
  }

  void fetchNext() {
    next(MovieCategory.nowPlaying);
  }
}
