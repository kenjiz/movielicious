import '../../domain/entity/credit.dart';

class CreditModel extends Credit {
  const CreditModel({
    required int id,
    required String name,
    required String profilePath,
    required String character,
    required int order,
  }) : super(
          id: id,
          name: name,
          profilePath: profilePath,
          character: character,
          order: order,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'profile_path': profilePath,
      'character': character,
      'order': order
    };
  }

  factory CreditModel.fromMap(Map<String, dynamic> map) => CreditModel(
        id: map['id'] as int,
        name: map['name'] as String,
        profilePath: map['profile_path'] as String,
        character: map['character'] as String,
        order: map['order'] as int,
      );
}
