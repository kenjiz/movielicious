import 'package:equatable/equatable.dart';

import 'package:movielicious/src/features/movie_details/movie_details.dart';

class MovieImageResponse extends Equatable {
  const MovieImageResponse({
    required this.backdrops,
  });

  final List<MovieImage> backdrops;

  @override
  List<Object> get props => [backdrops];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrops': backdrops.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieImageResponse.fromMap(Map<String, dynamic> map) {
    return MovieImageResponse(
      backdrops: List<MovieImage>.from(
        (map['backdrops'] as List<dynamic>).map<MovieImage>(
          (x) => MovieImage.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
