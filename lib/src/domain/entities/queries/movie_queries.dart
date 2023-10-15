import 'package:equatable/equatable.dart';

class MovieQueries extends Equatable {
  final int? page;
  final String? language;

  const MovieQueries({
    this.page = 1,
    this.language = 'en-US',
  });

  @override
  List<Object?> get props => [
        page,
        language,
      ];

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
}
