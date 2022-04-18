import 'dart:convert';

// Packages
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Cast {
  final int id;
  final String name;
  final String profilePath;
  final String character;
  final int order;

  Cast({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
    required this.order,
  });

  // Get the full path of the profile photo
  String get profilePhotoURL => dotenv.env['BASE_IMAGE_API_URL']! + profilePath;

  factory Cast.fromJson(Map<String, dynamic> map) {
    return Cast(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      profilePath: map['profile_path'] ?? '',
      character: map['character'] ?? '',
      order: map['order']?.toInt() ?? 0,
    );
  }

}
