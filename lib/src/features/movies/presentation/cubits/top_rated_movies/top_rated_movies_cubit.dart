import 'package:equatable/equatable.dart';

import '../../../../../core/constants/nums.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/models/movie_queries_model.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/entity/movie_response.dart';
import '../../../domain/usecase/get_top_rated_movies.dart';
import '../base_cubit.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends BaseCubit<TopRatedMoviesState, List<Movie>> {
  final GetTopRatedMovies useCase;
  TopRatedMoviesCubit(this.useCase) : super(const TopRatedMoviesLoading(), []);

  int _page = 1;
  bool noMoreData = false;

  Future<void> getTopRatedMovies() async {
    if (isBusy || noMoreData) return;

    await run(() async {
      final result = await useCase(MovieQueriesModel(page: _page));

      result.fold((ServerFailure failure) {
        emit(TopRatedMoviesFailed(error: failure));
      }, (MovieResponse response) {
        final movies = response.results;
        noMoreData = movies.length < kDefaultPageSize - 1;

        data.addAll(movies);
        _page++;
        emit(TopRatedMoviesSuccess(movies: data, noMoreData: noMoreData));
      });
    });
  }
}
