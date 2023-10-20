import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/presentation/cubits/top_rated_movies/top_rated_movies_cubit.dart';
import 'src/presentation/cubits/upcoming_movies/upcoming_movies_cubit.dart';
import 'src/presentation/themes/theme.dart';

import 'src/injection_container.dart';
import 'src/presentation/pages/home_page.dart';
import 'src/presentation/cubits/popular_movies/popular_movies_cubit.dart';

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
            create: (context) =>
                InjectionContainer.sl<PopularMoviesCubit>()..getPopularMovies(),
          ),
          BlocProvider<UpcomingMoviesCubit>(
            create: (context) => InjectionContainer.sl<UpcomingMoviesCubit>()
              ..getUpcomingMovies(),
          ),
          BlocProvider<TopRatedMoviesCubit>(
            create: (context) => InjectionContainer.sl<TopRatedMoviesCubit>()
              ..getTopRatedMovies(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
