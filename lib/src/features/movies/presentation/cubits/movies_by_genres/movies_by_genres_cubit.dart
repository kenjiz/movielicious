import 'package:equatable/equatable.dart';

import '../../../../../core/constants/nums.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../genre/data/model/genre_queries_model.dart';
import '../../../../genre/domain/entity/genre.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/entity/movie_response.dart';
import '../../../domain/usecase/get_movies_by_genres.dart';
import '../base_cubit.dart';
part 'movies_by_genres_state.dart';

class MoviesByGenresCubit extends BaseCubit<MoviesByGenresState, List<Movie>> {
  final GetMoviesByGenres useCase;
  MoviesByGenresCubit(this.useCase) : super(const MoviesByGenresLoading(), []);

  int _page = 1;
  bool noMoreData = false;

  Future<void> getMoviesByGenres({required Genre genre}) async {
    if (isBusy || noMoreData) return;

    await run(() async {
      final result = await useCase(
        GenreQueriesModel(
          page: _page,
          genreIds: [genre.id],
        ),
      );

      result.fold(
        (ServerFailure failure) {
          emit(MoviesByGenresFailed(error: failure));
        },
        (MovieResponse response) {
          final movies = response.results;
          noMoreData = movies.length < kDefaultPageSize - 1;

          data.addAll(movies);
          _page++;
          emit(MoviesByGenresSuccess(
            movies: data,
            noMoreData: noMoreData,
          ));
        },
      );
    });
  }
}
