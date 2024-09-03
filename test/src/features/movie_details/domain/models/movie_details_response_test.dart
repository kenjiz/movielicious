import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:movielicious/src/features/genres/domain/models/genre.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_details_response.dart';

const basePath = 'test/src/features/movie_details/domain/models';

void main() {
  final tJsonString = File('$basePath/fixtures/movie_details_response.json').readAsStringSync();
  final tMap = jsonDecode(tJsonString) as Map<String, dynamic>;

  const expResult = MovieDetailsResponse(
    id: 1,
    backdropPath: 'backdrop_path',
    genres: [Genre(id: 28, name: 'Action')],
    homepage: 'homepage',
    title: 'title',
    posterPath: 'poster_path',
    releaseDate: '2023-01-01',
    overview: 'overview',
    voteAverage: 1.1,
    runtime: 119,
  );

  test('should properly convert the response into MovieDetailsResponse object', () async {
    final result = MovieDetailsResponse.fromMap(tMap);

    expect(result, expResult);
  });
}
