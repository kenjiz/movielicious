import 'package:flutter/material.dart';

class MovieHeaderContainer extends StatelessWidget {
  const MovieHeaderContainer({
    required this.backgroundImage,
    required this.child,
    super.key,
  });

  final String backgroundImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black87, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          child,
          AppBar(backgroundColor: Colors.transparent),
        ],
      ),
    );
  }
}
