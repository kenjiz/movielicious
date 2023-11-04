import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/genre/presentation/cubit/genre/genre_cubit.dart';
import '../features/movies/presentation/cubits/popular_movies/popular_movies_cubit.dart';
import '../features/movies/presentation/cubits/top_rated_movies/top_rated_movies_cubit.dart';
import '../features/movies/presentation/cubits/upcoming_movies/upcoming_movies_cubit.dart';
import '../injection_container.dart';

class AppBlocProviders {
  final Widget child;

  AppBlocProviders({
    required this.child,
  });

  List<BlocProvider> _providerList() => [
        BlocProvider<PopularMoviesCubit>(
          create: (context) => InjectionContainer.sl<PopularMoviesCubit>()..getPopularMovies(),
        ),
        BlocProvider<UpcomingMoviesCubit>(
          create: (context) => InjectionContainer.sl<UpcomingMoviesCubit>()..getUpcomingMovies(),
        ),
        BlocProvider<TopRatedMoviesCubit>(
          create: (context) => InjectionContainer.sl<TopRatedMoviesCubit>()..getTopRatedMovies(),
        ),
        BlocProvider<GenreCubit>(
          create: (context) => InjectionContainer.sl<GenreCubit>()..getGenres(),
        ),
      ];

  MultiBlocProvider get initialize {
    return MultiBlocProvider(
      providers: _providerList(),
      child: child,
    );
  }
}
