import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final String id;
  final String name;
  final String imagePath;
  final String character;
  final int order;

  const Cast({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.character,
    required this.order,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      imagePath,
      character,
      order,
    ];
  }
}
