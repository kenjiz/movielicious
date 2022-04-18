import 'package:flutter/material.dart';

// Packages
import 'package:expandable_text/expandable_text.dart';

// Constants
import '../../../../constants/constants.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
    required this.content,
    required this.author,
    required this.dateTime,
  }) : super(key: key);

  final String content;
  final String author;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: kAppHorizontalMargin,
          right: kAppHorizontalMargin,
          bottom: kAppHorizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandableText(
            content,
            expandText: 'See more',
            collapseText: 'See less',
            maxLines: 4,
            linkColor: kOrange,
            style: kTextStyleBody2.copyWith(
              fontSize: 15,
              height: 1.5,
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            author,
            style: kTextStyleHeading4.copyWith(
              color: Colors.white54,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            dateTime,
            style: const TextStyle(
              color: Colors.white30,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.white54, height: 2),
        ],
      ),
    );
  }
}
