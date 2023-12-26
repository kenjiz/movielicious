import 'package:equatable/equatable.dart';

enum SortPopularity {
  descending('popularity.desc'),
  ascending('popularity.asc');

  final String name;
  const SortPopularity(this.name);
}

class GenreQueries extends Equatable {
  final int page;
  final String language;
  final SortPopularity sort;
  final List<int> genreIds;

  const GenreQueries({
    this.page = 1,
    this.language = 'en-US',
    this.sort = SortPopularity.descending,
    required this.genreIds,
  });

  @override
  List<Object?> get props => [
        page,
        language,
        sort,
        genreIds,
      ];

  @override
  bool get stringify => true;
}
