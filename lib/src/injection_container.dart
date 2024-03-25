import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';
import 'package:movielicious/src/features/movies/movies.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';

class DI {
  const DI._();

  static final sl = GetIt.instance;

  static Future<void> init() async {
    sl
      //* Blocs
      ..registerFactory(() => UpcomingMoviesBloc(sl()))
      ..registerFactory(() => TopRatedMoviesBloc(sl()))
      ..registerFactory(() => NowPlayingMoviesBloc(sl()))
      ..registerFactory(() => PopularMoviesBloc(sl()))
      ..registerFactory(() => MovieDetailsCubit(sl()))
      ..registerFactory(() => MovieGalleryCubit(sl()))
      ..registerFactory(() => MovieCreditsCubit(sl()))
      ..registerFactory(() => ReviewsBloc(sl()))

      //* Application Service
      ..registerLazySingleton<MovieService>(
        () => MovieService(sl()),
      )

      //* Repositories
      ..registerLazySingleton<MovieRepository>(() => MovieRepository(sl()))
      ..registerLazySingleton<MovieReviewsRepository>(
          () => MovieReviewsRepository(sl()))
      ..registerLazySingleton<MovieDetailsRepository>(
          () => MovieDetailsRepository(sl()))

      //* API
      ..registerLazySingleton(
        () => TMDBApi(sl()),
      )

      //* External
      ..registerLazySingleton(() {
        String apiAccessKey = '';

        if (dotenv.isInitialized) {
          apiAccessKey = dotenv.get(kAPIAccessTokenKey);
        }

        final dioHeaders = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiAccessKey',
        };

        return Dio(BaseOptions(headers: dioHeaders));
      });
  }
}
