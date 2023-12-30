import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/movies_cubit.dart';

import '../injection_container.dart';

class AppBlocProviders {
  final Widget child;

  AppBlocProviders({
    required this.child,
  });

  List<BlocProvider> _providerList() => [
        BlocProvider<PopularMoviesCubit>(
          create: (context) => DI.sl<PopularMoviesCubit>(),
        ),
        BlocProvider<UpcomingMoviesCubit>(
          create: (context) => DI.sl<UpcomingMoviesCubit>(),
        ),
        BlocProvider<TopRatedMoviesCubit>(
          create: (context) => DI.sl<TopRatedMoviesCubit>(),
        ),
        BlocProvider<NowPlayingMoviesCubit>(
          create: (context) => DI.sl<NowPlayingMoviesCubit>(),
        ),
      ];

  MultiBlocProvider get initialize {
    return MultiBlocProvider(
      providers: _providerList(),
      child: child,
    );
  }
}
