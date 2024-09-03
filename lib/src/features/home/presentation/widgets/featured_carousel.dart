import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/home/home.dart';
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
          StateStatus.success when state.movies.isNotEmpty => CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
              ),
              items: state.movies
                  .map((movie) => CarouselSlide(movie: movie))
                  .toList(),
            ),
          StateStatus.success => const Center(child: Text('Empty Movies..')),
          StateStatus.failure => Center(child: Text(state.error!.message)),
        };
      },
    );
  }
}
