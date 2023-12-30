import 'package:flutter/material.dart';
import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/core/widgets/custom_appbar.dart';

import 'package:movielicious/src/features/home/presentation/widgets/featured_carousel.dart';
import 'package:movielicious/src/features/home/presentation/widgets/home_header.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                LimitedBox(
                  maxHeight: height * 0.1,
                  child: const HomeHeader(),
                ),
                const SizedBox(height: kAppWidgetMargin),
                LimitedBox(
                  maxHeight: height * 0.3,
                  child: const FeaturedCarousel(),
                ),
                const SizedBox(height: kAppWidgetMargin),
                Expanded(child: Container(color: Colors.purple))
              ],
            ),
          );
        },
      ),
    );
  }
}
