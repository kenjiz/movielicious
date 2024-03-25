import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';

class ReviewListContainer extends StatelessWidget {
  const ReviewListContainer({
    required this.id,
    required this.movieTitle,
    super.key,
  });

  final MovieId id;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ReviewsPage(
                        id: id,
                        movieTitle: movieTitle,
                      ),
                    ));
                  },
                  child: Text(
                    'View All',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: kAccentColor,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                  )),
            ],
          ),
          const _MovieReviews()
        ].addEqualGap(gap: const Gap(10)),
      ),
    );
  }
}

class _MovieReviews extends StatelessWidget {
  const _MovieReviews();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (_, state) {
        return switch (state.status) {
          ReviewsStateStatus.loading => const Center(
              child: AdaptiveProgressIndicator(),
            ),
          ReviewsStateStatus.initial ||
          ReviewsStateStatus.success when state.reviews.isNotEmpty =>
            SizedBox(height: 550, child: ReviewsWidget(reviews: state.reviews)),
          ReviewsStateStatus.initial ||
          ReviewsStateStatus.success =>
            const Center(child: Text('Empty reviews...')),
          ReviewsStateStatus.error => Center(child: Text(state.error!.message)),
        };
      },
    );
  }
}
