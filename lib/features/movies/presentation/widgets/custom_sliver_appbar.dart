import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.flexibleWidget,
    required this.posterImage,
    this.pinned = true,
    this.floating = false,
    this.automaticallyImplyLeading = false,
    this.expandedHeight = 300,
    this.imageFit = BoxFit.cover,
  }) : super(key: key);

  final Widget flexibleWidget;
  final dynamic posterImage;
  final bool pinned;
  final bool floating;
  final bool automaticallyImplyLeading;
  final double expandedHeight;
  final BoxFit imageFit;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: 50,
      titleSpacing: 0,
      centerTitle: true,
      collapsedHeight: 50,
      expandedHeight: expandedHeight,
      pinned: pinned,
      floating: floating,
      flexibleSpace: FlexibleSpaceBar(
        title: flexibleWidget,
        expandedTitleScale: 1.3,
        titlePadding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        centerTitle: false,
        background: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                image: DecorationImage(
                  fit: imageFit,
                  image: posterImage,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
