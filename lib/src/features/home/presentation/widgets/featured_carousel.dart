import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movies/movies.dart';

class FeaturedCarousel extends StatelessWidget {
  const FeaturedCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesBloc, MoviesState>(
      builder: (context, state) {
        return switch (state.status) {
          StateStatus.loading => const Center(
              child: AdaptiveProgressIndicator(),
            ),
          StateStatus.success => state.movies.isNotEmpty
              ? CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                  ),
                  items: _imageSliders(context, state.movies),
                )
              : const Center(child: Text('Empty Movies..')),
          StateStatus.failure => Center(
              child: Text(state.error!.message),
            ),
        };
      },
    );
  }

  List<Widget> _imageSliders(BuildContext context, List<Movie> movies) => movies
      .map(
        (movie) => GestureDetector(
          onTap: () {
            final movieId = movie.id;
            //TODO: add callback
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: [
                  Image.network(
                    kBaseImagePath + movie.posterPath,
                    loadingBuilder: (context, child, loadingProgress) {
                      final totalBytes =
                          loadingProgress?.expectedTotalBytes ?? 0;
                      final bytesLoaded =
                          loadingProgress?.cumulativeBytesLoaded ?? 0;
                      return Center(
                        child: bytesLoaded < totalBytes
                            ? const AdaptiveProgressIndicator()
                            : child,
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
                      child: MovieTitle(
                        title: movie.title,
                        genre: movie.genresByName,
                        vote: movie.getVote,
                        year: movie.getYear,
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
