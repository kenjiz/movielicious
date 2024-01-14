import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/core/service/tmdb_api.dart';
import 'package:movielicious/src/features/movie_details/presentation/bloc/details/movie_details_cubit.dart';
import 'package:movielicious/src/features/movies/application/movie_service.dart';
import 'package:movielicious/src/features/movies/data/movie_repository.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/listings/movies_bloc.dart';

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
