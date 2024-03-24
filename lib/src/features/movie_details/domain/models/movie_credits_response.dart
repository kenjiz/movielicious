import 'package:equatable/equatable.dart';

import 'package:movielicious/src/features/movie_details/domain/models/movie_cast.dart';

class MovieCreditsResponse extends Equatable {
  const MovieCreditsResponse({
    required this.cast,
  });

  final List<MovieCast> cast;

  @override
  List<Object> get props => [cast];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieCreditsResponse.fromMap(Map<String, dynamic> map) {
    return MovieCreditsResponse(
      cast: List<MovieCast>.from(
        map['cast']?.map<MovieCast>((x) => MovieCast.fromMap(x)),
      ),
    );
  }
}
