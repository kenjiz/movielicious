import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';

class ReviewListContainer extends StatelessWidget {
  const ReviewListContainer({super.key});

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
                  onPressed: () {},
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
            _ReviewsWidget(reviews: state.reviews),
          ReviewsStateStatus.initial ||
          ReviewsStateStatus.success =>
            const Center(child: Text('Empty reviews...')),
          ReviewsStateStatus.error => Center(child: Text(state.error!.message)),
        };
      },
    );
  }
}

class _ReviewsWidget extends StatelessWidget {
  const _ReviewsWidget({
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        separatorBuilder: (_, __) =>
            const Divider(color: Colors.white24, thickness: 1),
        itemCount: reviews.length < 2 ? reviews.length : 2,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(review.content),
                const Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${review.authorDetails.rating} ⭐'),
                    const Gap(5),
                    Text(review.author),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
