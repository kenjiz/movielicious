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
    const List<Color> colorList = [
      Color(0xFFe5383b),
      Color(0xFF1b263b),
      Color(0xFF386641),
      Color(0xFF0096c7),
      Color(0xFFdf367c),
      Color(0xFF7209b7),
      Color(0xFF006ba6),
    ];

    return colorList[Random().nextInt(colorList.length)];
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
