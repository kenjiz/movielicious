import '../../domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': int.parse(id),
      'name': name,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: (map['id'] as dynamic).toString(),
      name: map['name'] as String,
    );
  }
}
