import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/reviews/reviews.dart';
import 'package:movielicious/src/injection_container.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({
    super.key,
    required this.id,
    required this.movieTitle,
  });

  final MovieId id;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews: $movieTitle')),
      body: BlocProvider<ReviewsBloc>(
        create: (context) =>
            DI.sl<ReviewsBloc>()..add(ReviewListFetched(id: id, page: 1)),
        child: ReviewsList(id: id),
      ),
    );
  }
}
