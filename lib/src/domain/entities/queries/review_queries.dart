import 'package:equatable/equatable.dart';

abstract class ReviewQueries extends Equatable {
  final int movieId;
  final int? page;
  final String? language;

  const ReviewQueries({
    required this.movieId,
    this.page = 1,
    this.language = 'en-US',
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        movieId,
        page,
        language,
      ];
}
