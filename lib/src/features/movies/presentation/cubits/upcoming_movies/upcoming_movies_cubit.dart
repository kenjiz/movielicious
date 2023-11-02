import 'package:equatable/equatable.dart';

import '../../../../../core/constants/nums.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/models/movie_queries_model.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/entity/movie_response.dart';
import '../../../domain/usecase/get_upcoming_movies.dart';
import '../base_cubit.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends BaseCubit<UpcomingMoviesState, List<Movie>> {
  final GetUpcomingMovies useCase;
  UpcomingMoviesCubit(this.useCase) : super(const UpcomingMoviesLoading(), []);

  int _page = 1;
  bool noMoreData = false;

  Future<void> getUpcomingMovies() async {
    if (isBusy || noMoreData) return;

    await run(() async {
      final result = await useCase(MovieQueriesModel(page: _page));

      result.fold((ServerFailure failure) {
        emit(UpcomingMoviesFailed(error: failure));
      }, (MovieResponse response) {
        final movies = response.results;
        noMoreData = movies.length < kDefaultPageSize - 1;

        data.addAll(movies);
        _page++;
        emit(UpcomingMoviesSuccess(movies: data, noMoreData: noMoreData));
      });
    });
  }
}
