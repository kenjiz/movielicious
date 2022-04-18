import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class Genre {
  final int id;
  final String name;
  final Color? color;

  Genre({
    required this.id,
    required this.name,
    this.color = Colors.deepPurple,
  });

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(0.3), // randomized color values
    );
  }

  factory Genre.fromJson(String source) => Genre.fromMap(json.decode(source));

  static Future<List<Genre>> load() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/genre.json');
      final data = await json.decode(response);
      final List<Genre> genreList = [];
      for (var i in data['genres']) {
        genreList.add(Genre.fromMap(i));
      }
      return genreList;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
