part of 'movie_images_cubit.dart';

class MovieImagesState extends Equatable {
  const MovieImagesState({
    required this.movieImages,
    this.status = StateStatus.loading,
    this.error,
  });

  final List<MovieImage> movieImages;
  final StateStatus status;
  final MovieDetailsError? error;

  @override
  List<Object?> get props => [movieImages, status, error];

  MovieImagesState copyWith({
    List<MovieImage>? movieImages,
    StateStatus? status,
    MovieDetailsError? error,
  }) {
    return MovieImagesState(
      movieImages: movieImages ?? this.movieImages,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
