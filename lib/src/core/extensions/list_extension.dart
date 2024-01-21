import 'package:movielicious/src/features/genres/domain/models/genre.dart';

extension MovieGenres on List<Genre> {
  String get getGenresAsString => map((g) => g.name).take(2).join('/');
}
