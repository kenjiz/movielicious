import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.title,
    required this.year,
    required this.genre,
    required this.vote,
  });

  final String title;
  final String year;
  final String genre;
  final String vote;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '$year | $genre | ⭐$vote',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
