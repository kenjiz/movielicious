// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart';

class MovieImagesContainer extends StatelessWidget {
  const MovieImagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieImagesCubit, MovieImagesState>(
      builder: (context, state) {
        return switch (state.status) {
          StateStatus.loading => const Center(
              child: AdaptiveProgressIndicator(),
            ),
          StateStatus.success when state.movieImages.isNotEmpty =>
            _GalleryContainer(
              child: CarouselSlider.builder(
                itemCount: state.movieImages.length,
                itemBuilder: (_, index, __) =>
                    _ImagesSlide(image: state.movieImages[index]),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  animateToClosest: true,
                  enableInfiniteScroll: true,
                ),
              ),
            ),
          StateStatus.success => const Center(child: Text('Empty images..')),
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

class _ImagesSlide extends StatelessWidget {
  const _ImagesSlide({required this.image});

  final MovieImage image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: handle enlarge on tap
      },
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(
            kBaseImagePath + image.filePath,
            // TODO: refactor
            loadingBuilder: (context, child, loadingProgress) {
              final totalBytes = loadingProgress?.expectedTotalBytes ?? 0;
              final bytesLoaded = loadingProgress?.cumulativeBytesLoaded ?? 0;
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
        ),
      ),
    );
  }
}
