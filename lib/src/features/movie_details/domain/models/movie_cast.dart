import 'package:equatable/equatable.dart';

typedef CastId = String;

class MovieCast extends Equatable {
  const MovieCast({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
    required this.order,
  });

  final CastId id;
  final String name;
  final String character;
  final String profilePath;
  final int order;

  @override
  List<Object> get props {
    return [
      id,
      name,
      character,
      profilePath,
      order,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'character': character,
      'profilePath': profilePath,
      'order': order,
    };
  }

  factory MovieCast.fromMap(Map<String, dynamic> map) {
    return MovieCast(
      id: map['id'] as CastId,
      name: map['name'] as String,
      character: map['character'] as String,
      profilePath: map['profilePath'] as String,
      order: map['order'] as int,
    );
  }
}
