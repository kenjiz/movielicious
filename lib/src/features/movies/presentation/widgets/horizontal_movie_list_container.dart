import 'package:flutter/material.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';

class HorizontalMovieListContainer extends StatelessWidget {
  const HorizontalMovieListContainer({
    super.key,
    required this.title,
    required this.list,
    this.height,
  });

  final String title;
  final Widget list;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalMargin,
          ),
          child: Text(
            title,
            style: kTextStyleHeading4,
          ),
        ),
        const SizedBox(height: kAppTitleMargin),
        Expanded(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: <Color>[
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.transparent,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0, 0.25, 0.5, 0.85, 1],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: list,
          ),
        ),
      ],
    );
  }
}
