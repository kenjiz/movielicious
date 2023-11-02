import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movielicious/src/features/genre/presentation/cubit/genre/genre_cubit.dart';
import 'src/core/themes/theme.dart';

import 'src/features/movies/presentation/cubits/popular_movies/popular_movies_cubit.dart';
import 'src/features/movies/presentation/cubits/top_rated_movies/top_rated_movies_cubit.dart';
import 'src/features/movies/presentation/cubits/upcoming_movies/upcoming_movies_cubit.dart';
import 'src/injection_container.dart';
import 'src/features/home/presentation/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'assets/.env');
  await InjectionContainer.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      title: 'Movielicious',
      home: MultiBlocProvider(
        providers: [
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
        ],
        child: const HomePage(),
      ),
    );
  }
}
