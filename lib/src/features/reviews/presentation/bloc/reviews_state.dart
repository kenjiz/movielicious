part of 'reviews_bloc.dart';

class ReviewsState extends Equatable {
  const ReviewsState({
    this.status = ReviewsStateStatus.initial,
    this.reviews = const <Review>[],
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.error,
  });

  final ReviewsStateStatus status;
  final List<Review> reviews;
  final int currentPage;
  final bool hasReachedMax;
  final MovieReviewsError? error;

  @override
  List<Object?> get props {
    return [
      status,
      reviews,
      currentPage,
      hasReachedMax,
      error,
    ];
  }

  @override
  bool get stringify => true;

  ReviewsState copyWith({
    ReviewsStateStatus? status,
    List<Review>? reviews,
    int? currentPage,
    bool? hasReachedMax,
    MovieReviewsError? error,
  }) {
    return ReviewsState(
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error ?? this.error,
    );
  }
}

enum ReviewsStateStatus { initial, loading, error, success }
