import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/features/movies/domain/models/movie.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/movies_cubit.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MovieLicious',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_outlined))],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return LimitedBox(
            maxHeight: height,
            maxWidth: width,
            child: Column(
              children: [
                LimitedBox(
                  maxHeight: height * 0.1,
                  child: _header(context),
                ),
                Expanded(
                  child: LimitedBox(
                    maxHeight: height * 0.2,
                    child: BlocBuilder<NowPlayingMoviesCubit, MoviesState>(
                      builder: (context, state) {
                        return switch (state) {
                          MoviesLoading() => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          MoviesLoaded(movies: var items) when items.isNotEmpty => CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                enlargeCenterPage: true,
                              ),
                              items: imageSliders(context, state.movies),
                            ),
                          MoviesLoaded() => const Center(child: Text('Empty Movies..')),
                          MoviesFailure(:var message) => Center(child: Text(message))
                        };
                      },
                    ),
                  ),
                ),
                Expanded(child: Container(color: Colors.purple))
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppWidgetPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Now Playing', style: Theme.of(context).textTheme.headlineLarge),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            child: const Icon(
              Icons.search_outlined,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> imageSliders(BuildContext context, List<Movie> movies) => movies
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: [
                Image.network(
                  kBaseImagePath + item.posterPath,
                  loadingBuilder: (context, child, loadingProgress) {
                    final totalBytes = loadingProgress?.expectedTotalBytes ?? 0;
                    final bytesLoaded = loadingProgress?.cumulativeBytesLoaded ?? 0;
                    return Center(
                      child: bytesLoaded < totalBytes ? const CircularProgressIndicator(color: Colors.white) : child,
                    );
                  },
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  width: 1000,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: Theme.of(context).textTheme.labelLarge),
                        Text('${item.getYear} | ${item.genresByName} | ⭐${item.getVote}',
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      .toList();
}
