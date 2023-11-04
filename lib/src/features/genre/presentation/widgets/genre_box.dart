import 'package:flutter/material.dart';
import 'dart:math';

import '../../domain/entity/genre.dart';

class GenreBox extends StatelessWidget {
  final Genre genre;

  const GenreBox({
    super.key,
    required this.genre,
  });

  Color get getRandomBoxColor {
    return Color((Random().nextDouble() * 0xFF000000).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getRandomBoxColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(right: 10),
      child: Text(
        genre.name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
