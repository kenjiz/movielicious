import 'package:equatable/equatable.dart';
import 'package:movielicious/src/core/core.dart';

typedef CastId = int;

class MovieCast extends Equatable {
  const MovieCast({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
  });

  final CastId id;
  final String name;
  final String? profilePath;
  final String character;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      character,
      profilePath,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'character': character,
      'profilePath': profilePath,
    };
  }

  factory MovieCast.fromMap(Map<String, dynamic> map) {
    return MovieCast(
      id: map['id'] as CastId,
      name: map['name'] as String,
      profilePath: (map['profile_path'] != null)
          ? kBaseImagePath + map['profile_path']
          : null,
      character: map['character'] as String,
    );
  }
}
