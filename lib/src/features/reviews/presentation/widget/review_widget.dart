import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({
    required this.reviews,
    this.maxLength = 2,
    super.key,
  });

  final List<Review> reviews;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) =>
          const Divider(color: Colors.white24, thickness: 1),
      itemCount: reviews.length < 2 ? reviews.length : maxLength,
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
    );
  }
}
