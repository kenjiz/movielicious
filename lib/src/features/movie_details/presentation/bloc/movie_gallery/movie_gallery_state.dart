part of 'movie_gallery_cubit.dart';

class MovieGalleryState extends Equatable {
  const MovieGalleryState({
    required this.images,
    this.status = StateStatus.loading,
    this.error,
  });

  final List<MovieImage> images;
  final StateStatus status;
  final MovieDetailsError? error;

  @override
  List<Object?> get props => [images, status, error];

  MovieGalleryState copyWith({
    List<MovieImage>? images,
    StateStatus? status,
    MovieDetailsError? error,
  }) {
    return MovieGalleryState(
      images: images ?? this.images,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
