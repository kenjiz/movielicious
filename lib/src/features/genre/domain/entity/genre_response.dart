import 'package:equatable/equatable.dart';

import 'genre.dart';

abstract class GenreResponse extends Equatable {
  final List<Genre> genres;
  const GenreResponse({
    required this.genres,
  });

  @override
  List<Object> get props => [genres];

  @override
  bool get stringify => true;
}
