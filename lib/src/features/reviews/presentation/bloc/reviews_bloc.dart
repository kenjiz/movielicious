import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/core/transformers/throttle_droppable.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc(this._repository) : super(const ReviewsState()) {
    on<ReviewListFetched>(
      _onReviewListFetched,
      transformer: throttleDroppable(),
    );
  }

  final MovieReviewsRepository _repository;

  Future<void> _onReviewListFetched(
    ReviewListFetched event,
    Emitter<ReviewsState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (state.status == ReviewsStateStatus.initial) {
      emit(state.copyWith(status: ReviewsStateStatus.loading));
      final result = _repository.getMovieReviews(event.id, event.page);
      await result
          .match(
              (error) => emit(state.copyWith(
                    status: ReviewsStateStatus.error,
                    error: const MovieReviewsError(
                        message: 'Failed to fetch initial reviews'),
                  )),
              (response) => emit(
                    state.copyWith(
                      status: ReviewsStateStatus.success,
                      reviews: response.results,
                      currentPage: response.page,
                      hasReachedMax: false,
                    ),
                  ))
          .run();
      return;
    }

    final result = _repository.getMovieReviews(event.id, event.page);

    await result
        .match(
          (error) => emit(state.copyWith(
            status: ReviewsStateStatus.error,
            error: const MovieReviewsError(
                message: 'Failed to get succeeding reviews.'),
          )),
          (response) => state.currentPage < response.totalPages
              ? state.copyWith(
                  status: ReviewsStateStatus.success,
                  reviews: List.of(state.reviews)..addAll(response.results),
                  currentPage: response.page,
                  hasReachedMax: false)
              : emit(state.copyWith(hasReachedMax: true)),
        )
        .run();
  }

  void fetchNext(MovieId id) {
    add(ReviewListFetched(id: id, page: state.currentPage + 1));
  }
}
