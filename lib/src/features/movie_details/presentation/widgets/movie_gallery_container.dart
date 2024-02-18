import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';

class MovieGalleryContainer extends StatelessWidget {
  const MovieGalleryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieGalleryCubit, MovieGalleryState>(
      builder: (context, state) {
        return switch (state.status) {
          StateStatus.loading => const Center(
              child: AdaptiveProgressIndicator(),
            ),
          StateStatus.success when state.images.isNotEmpty => _GalleryContainer(
              child: CarouselSlider.builder(
                itemCount: state.images.length,
                itemBuilder: (_, index, __) =>
                    _GalleryImage(image: state.images[index]),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  animateToClosest: true,
                  enableInfiniteScroll: true,
                ),
              ),
            ),
          StateStatus.success => const Center(child: Text('Empty gallery..')),
          StateStatus.failure => Center(child: Text(state.error!.message)),
        };
      },
    );
  }
}

class _GalleryContainer extends StatelessWidget {
  final Widget child;

  const _GalleryContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gallery',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
          ),
          child
        ].addEqualGap(gap: const Gap(10)),
      ),
    );
  }
}

class _GalleryImage extends StatelessWidget {
  const _GalleryImage({required this.image});

  final MovieImage image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: handle enlarge on tap
      },
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: LoadedImage(source: image.filePath),
          ),
        ),
      ),
    );
  }
}
