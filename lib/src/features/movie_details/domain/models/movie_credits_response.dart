// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_cast.dart';

class MovieCreditsResponse extends Equatable {
  const MovieCreditsResponse({
    required this.id,
    required this.cast,
  });

  final MovieId id;
  final List<MovieCast> cast;

  @override
  List<Object> get props => [id, cast];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieCreditsResponse.fromMap(Map<String, dynamic> map) {
    return MovieCreditsResponse(
      id: map['id'] as MovieId,
      cast: List<MovieCast>.from(
        (map['cast'] as List<dynamic>).map<MovieCast>(
          (x) => MovieCast.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieCreditsResponse.fromJson(String source) =>
      MovieCreditsResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
