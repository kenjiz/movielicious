import 'package:movielicious/src/features/errors/domain/models/request_error.dart';

class MoviesError implements RequestError {
  const MoviesError();

  @override
  String get message => 'There\'s a problem fetching movies from API.';
}
