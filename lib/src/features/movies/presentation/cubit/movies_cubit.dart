import 'package:equatable/equatable.dart';
import 'package:movielicious/src/features/movies/domain/enums/movie_category.dart';
import 'package:movielicious/src/features/movies/domain/models/movie.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/base_movies_cubit.dart';

part 'movies_state.dart';

class PopularMoviesCubit extends BaseMoviesCubit {
  PopularMoviesCubit(super.service) {
    fetchMoviesByCategory(MovieCategory.popular);
  }
}

class UpcomingMoviesCubit extends BaseMoviesCubit {
  UpcomingMoviesCubit(super.service) {
    fetchMoviesByCategory(MovieCategory.upcoming);
  }
}

class TopRatedMoviesCubit extends BaseMoviesCubit {
  TopRatedMoviesCubit(super.service) {
    fetchMoviesByCategory(MovieCategory.topRated);
  }
}

class NowPlayingMoviesCubit extends BaseMoviesCubit {
  NowPlayingMoviesCubit(super.service) {
    fetchMoviesByCategory(MovieCategory.nowPlaying);
  }
}
