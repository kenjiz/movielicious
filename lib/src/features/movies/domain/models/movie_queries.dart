import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MovieQueries extends Equatable {
  final int? page;
  final String? language;

  const MovieQueries({
    required this.page,
    this.language,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'language': language,
    };
  }

  factory MovieQueries.fromMap(Map<String, dynamic> map) {
    return MovieQueries(
      page: map['page'] != null ? map['page'] as int : null,
      language: map['language'] != null ? map['language'] as String : null,
    );
  }

  @override
  List<Object?> get props => [page, language];

  @override
  bool? get stringify => kDebugMode;
}
