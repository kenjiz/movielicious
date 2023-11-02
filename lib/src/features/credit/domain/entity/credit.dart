import 'package:equatable/equatable.dart';

class Credit extends Equatable {
  final int id;
  final String name;
  final String profilePath;
  final String character;
  final int order;

  const Credit({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
    required this.order,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      profilePath,
      character,
      order,
    ];
  }

  @override
  bool get stringify => true;
}
