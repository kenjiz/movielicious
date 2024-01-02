import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  @override
  bool? get stringify => kDebugMode;
}
