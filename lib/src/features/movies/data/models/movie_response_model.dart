import 'movie_model.dart';
import '../../domain/entity/movie_response.dart';

class MovieResponseModel extends MovieResponse {
  const MovieResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results.map((x) => (x as MovieModel).toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory MovieResponseModel.fromMap(Map<String, dynamic> map) {
    return MovieResponseModel(
      page: map['page'] as int,
      results: List<MovieModel>.from(
        (map['results'] as List).map<MovieModel>(
          (x) => MovieModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalPages: map['total_pages'] as int,
      totalResults: map['total_results'] as int,
    );
  }
}
