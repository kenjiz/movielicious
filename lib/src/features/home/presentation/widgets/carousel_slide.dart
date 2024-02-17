import 'package:flutter/material.dart';
import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/movie_details.dart'
    hide MovieTitle;
import 'package:movielicious/src/features/movies/movies.dart';

class CarouselSlide extends StatelessWidget {
  const CarouselSlide({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(
              movieId: movie.id,
              title: movie.title,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: [
              Image.network(
                kBaseImagePath + movie.posterPath,
                // TODO: refactor
                loadingBuilder: (context, child, loadingProgress) {
                  final totalBytes = loadingProgress?.expectedTotalBytes ?? 0;
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
    );
  }
}
