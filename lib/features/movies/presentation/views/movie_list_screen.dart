import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movielicious/features/movies/models/models.dart';
import 'package:movielicious/features/movies/presentation/controllers/movie_list_controller.dart';
import 'package:movielicious/features/movies/presentation/widgets/rating_box.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class MovieListScreen extends ConsumerWidget {
  const MovieListScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  static const String routeName = 'movie-list';
  final MovieArgs args;

  static Route route(args) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) {
        return MovieListScreen(args: args);
      },
    );
  }

  String getTitle(
      {required MovieCategory category, String? searchKey, Genre? genre}) {
    String title = '';
    if (category == MovieCategory.popular) {
      title = 'Popular Movies';
    } else if (category == MovieCategory.upcoming) {
      title = 'Upcoming Movies';
    } else if (category == MovieCategory.bySearch && searchKey != null) {
      title = 'Search: $searchKey';
    } else if (category == MovieCategory.byTag && genre != null) {
      final tag = genre.name;
      title = 'All $tag Movies';
    }
    return title;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _size = MediaQuery.of(context).size;

    // final movieData = ref.watch(movieListDataProvider(args));
    final movies = ref.watch(movieListControllerProvider(args)).movies;

    final title = getTitle(
      category: args.category,
      genre: args.genre,
      searchKey: args.searchKey,
    );

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: movies.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ))
            : NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  final before = notification.metrics.extentBefore;
                  final max = notification.metrics.maxScrollExtent;
                  if (before == max) {
                    ref
                        .watch(movieListControllerProvider(args).notifier)
                        .getMovies();
                    return true;
                  }
                  return false;
                },
                child: Stack(
                  children: [
                    Container(
                      width: _size.width,
                      height: _size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: movies[0].getMoviePoster, fit: BoxFit.cover),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          color: Colors.white.withOpacity(0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: GridView.builder(
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('movie-detail',
                                arguments: movies[index].id);
                          },
                          child: MovieTile(movie: movies[index]),
                        ),
                        itemCount: movies.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 2 / 3,
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
