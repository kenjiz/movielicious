import '../../../data/models/genre_model.dart';
import '../../../domain/entities/responses/genre_response.dart';

class GenreResponseModel extends GenreResponse {
  const GenreResponseModel({required super.genres});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'genres': genres.map((x) => (x as GenreModel).toMap()).toList(),
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
}
