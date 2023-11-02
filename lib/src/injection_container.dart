import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'core/constants/http_constants.dart';
import 'features/movies/data/remote/datasource/movie_remote_data_source.dart';
import 'features/movies/data/remote/datasource/movie_remote_data_source_impl.dart';
import 'features/movies/data/remote/service/movie_service.dart';
import 'features/movies/data/repositories/movie_repository_impl.dart';
import 'features/movies/domain/repository/movie_repositories.dart';
import 'features/movies/domain/usecase/get_popular_movies.dart';
import 'features/movies/domain/usecase/get_top_rated_movies.dart';
import 'features/movies/domain/usecase/get_upcoming_movies.dart';
import 'features/movies/presentation/cubits/popular_movies/popular_movies_cubit.dart';
import 'features/movies/presentation/cubits/top_rated_movies/top_rated_movies_cubit.dart';
import 'features/movies/presentation/cubits/upcoming_movies/upcoming_movies_cubit.dart';

class InjectionContainer {
  const InjectionContainer._();

  static final sl = GetIt.instance;

  static Future<void> init() async {
    sl
      //* Cubits
      ..registerFactory(
        () => PopularMoviesCubit(sl()),
      )
      ..registerFactory(
        () => UpcomingMoviesCubit(sl()),
      )
      ..registerFactory(
        () => TopRatedMoviesCubit(sl()),
      )
      //* Usecases
      ..registerLazySingleton(
        () => GetUpcomingMovies(repository: sl()),
      )
      ..registerLazySingleton(
        () => GetPopularMovies(repository: sl()),
      )
      ..registerLazySingleton(
        () => GetTopRatedMovies(repository: sl()),
      )
      //* Repositories
      ..registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(sl()),
      )
      //* Data Sources
      ..registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(service: sl()),
      )
      //* Services
      ..registerLazySingleton(
        () => MovieService(sl()),
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
