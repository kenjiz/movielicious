import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';

class MovieResponseModel extends Equatable {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  const MovieResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object> get props => [page, results, totalPages, totalResults];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
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

  @override
  bool get stringify => true;
}
