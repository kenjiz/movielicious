import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/listings/movies_bloc.dart';

import 'package:movielicious/src/injection_container.dart';

class AppBlocProviders {
  final Widget child;

  AppBlocProviders({
    required this.child,
  });

  List<BlocProvider> _providerList() => [
        BlocProvider<PopularMoviesBloc>(
          create: (context) => DI.sl<PopularMoviesBloc>(),
        ),
        BlocProvider<UpcomingMoviesBloc>(
          create: (context) => DI.sl<UpcomingMoviesBloc>(),
        ),
        BlocProvider<TopRatedMoviesBloc>(
          create: (context) => DI.sl<TopRatedMoviesBloc>(),
        ),
        BlocProvider<NowPlayingMoviesBloc>(
          create: (context) => DI.sl<NowPlayingMoviesBloc>(),
        ),
      ];

  MultiBlocProvider get initialize {
    return MultiBlocProvider(
      providers: _providerList(),
      child: child,
    );
  }
}
