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
          create: (context) => InjectionContainer.sl<PopularMoviesCubit>(),
        ),
        BlocProvider<UpcomingMoviesCubit>(
          create: (context) => InjectionContainer.sl<UpcomingMoviesCubit>(),
        ),
        BlocProvider<TopRatedMoviesCubit>(
          create: (context) => InjectionContainer.sl<TopRatedMoviesCubit>(),
        ),
      ];

  MultiBlocProvider get initialize {
    return MultiBlocProvider(
      providers: _providerList(),
      child: child,
    );
  }
}
