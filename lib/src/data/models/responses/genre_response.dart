import 'package:equatable/equatable.dart';

import '../../../data/models/genre_model.dart';

class GenreResponseModel extends Equatable {
  final List<GenreModel> genres;
  const GenreResponseModel({
    required this.genres,
  });

  @override
  List<Object> get props => [genres];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'genres': genres.map((x) => x.toMap()).toList(),
    };
  }

  factory GenreResponseModel.fromMap(Map<String, dynamic> map) {
    return GenreResponseModel(
      genres: List<GenreModel>.from(
        (map['genres'] as List).map<GenreModel>(
          (x) => GenreModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;
}
