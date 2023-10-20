import 'package:flutter/material.dart';

import '../../core/constants/theme_constants.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
      child: double.parse(rating) > 0
          ? Text(
              '★ $rating',
              style: kTextStyleBody2.copyWith(
                color: kYellow,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            )
          : const Text('N/A'),
    );
  }
}
