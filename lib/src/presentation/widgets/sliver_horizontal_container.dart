import 'package:flutter/material.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';

class SliverHorizontalContainer extends StatelessWidget {
  const SliverHorizontalContainer({
    super.key,
    required this.sectionTitle,
    required this.list,
  });

  final String sectionTitle;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        width: size.width,
        height: size.height * 0.3,
        margin: const EdgeInsets.symmetric(
          vertical: kAppWidgetMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalMargin,
              ),
              child: Text(
                sectionTitle,
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
        ),
      ),
    );
  }
}
