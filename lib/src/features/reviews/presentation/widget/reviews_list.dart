import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';

class ReviewsList extends StatefulWidget {
  const ReviewsList({
    required this.id,
    super.key,
  });

  final MovieId id;

  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ReviewsBloc>().fetchNext(widget.id);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        return switch (state.status) {
          ReviewsStateStatus.loading =>
            const Center(child: AdaptiveProgressIndicator()),
          ReviewsStateStatus.initial ||
          ReviewsStateStatus.success when state.reviews.isNotEmpty =>
            Padding(
              padding: const EdgeInsets.all(20),
              child: ReviewsWidget(
                reviews: state.reviews,
                maxLength: state.reviews.length,
              ),
            ),
          ReviewsStateStatus.initial ||
          ReviewsStateStatus.success =>
            const Center(
              child: Text('Empty reviews.'),
            ),
          ReviewsStateStatus.error => Center(child: Text(state.error!.message)),
        };
      },
    );
  }
}
