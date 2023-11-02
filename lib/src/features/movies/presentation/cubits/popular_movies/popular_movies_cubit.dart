import 'package:equatable/equatable.dart';

import '../../../../../core/constants/nums.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/models/movie_queries_model.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/entity/movie_response.dart';
import '../../../domain/usecase/get_popular_movies.dart';
import '../base_cubit.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends BaseCubit<PopularMoviesState, List<Movie>> {
  final GetPopularMovies useCase;
  PopularMoviesCubit(this.useCase) : super(const PopularMoviesLoading(), []);

  int _page = 1;
  bool noMoreData = false;

  Future<void> getPopularMovies() async {
    if (isBusy || noMoreData) return;

    await run(() async {
      final result = await useCase(MovieQueriesModel(page: _page));

      result.fold((ServerFailure failure) {
        emit(PopularMoviesFailed(error: failure));
      }, (MovieResponse response) {
        final movies = response.results;
        noMoreData = movies.length < kDefaultPageSize - 1;

        data.addAll(movies);
        _page++;
        emit(PopularMoviesSuccess(movies: data, noMoreData: noMoreData));
      });
    });
  }
}
