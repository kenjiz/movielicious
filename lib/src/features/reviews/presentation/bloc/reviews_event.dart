part of 'reviews_bloc.dart';

sealed class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

class ReviewListFetched extends ReviewsEvent {
  const ReviewListFetched({
    required this.id,
    required this.page,
  });

  final MovieId id;
  final int page;
}
