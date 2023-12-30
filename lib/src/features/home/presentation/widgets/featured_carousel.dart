import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/constants/http_constants.dart';
import 'package:movielicious/src/features/movies/domain/models/movie_with_genre.dart';
import 'package:movielicious/src/features/movies/presentation/cubit/movies_cubit.dart';

class FeaturedCarousel extends StatelessWidget {
  const FeaturedCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesCubit, MoviesState>(
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
    );
  }

  List<Widget> imageSliders(BuildContext context, List<MovieWithGenre> movies) => movies
      .map(
        (item) => GestureDetector(
          onTap: () {
            final movieId = item.id;
            //TODO: add callback
          },
          child: Container(
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
        ),
      )
      .toList();
}
