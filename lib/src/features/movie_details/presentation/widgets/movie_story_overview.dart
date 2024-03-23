import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/core/extensions/list_extension.dart';

class MovieStoryOverview extends StatelessWidget {
  const MovieStoryOverview({
    required this.content,
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Story',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
          ),
          ExpandableText(
            content,
            expandText: 'show more',
            collapseText: 'show less',
            maxLines: 2,
          ),
        ].addEqualGap(gap: const Gap(10)),
      ),
    );
  }
}
