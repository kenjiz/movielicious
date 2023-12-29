import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/core/service/tmdb_api.dart';
import 'package:movielicious/src/features/movies/application/movie_service.dart';
import 'package:movielicious/src/features/movies/data/movie_repository.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/movies_cubit.dart';

class InjectionContainer {
  const InjectionContainer._();

  static final sl = GetIt.instance;

  static Future<void> init() async {
    sl
      //* Cubits
      ..registerFactory(() => UpcomingMoviesCubit(sl()))
      ..registerFactory(() => TopRatedMoviesCubit(sl()))
      ..registerFactory(() => NowPlayingMoviesCubit(sl()))
      ..registerFactory(() => PopularMoviesCubit(sl()))

      //* Application Service
      ..registerLazySingleton<MovieService>(
        () => MovieService(sl()),
      )

      //* Repositories
      ..registerLazySingleton<MovieRepository>(
        () => MovieRepository(sl()),
      )

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
