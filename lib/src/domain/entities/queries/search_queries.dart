import 'package:equatable/equatable.dart';

abstract class SearchQueries extends Equatable {
  final String searchTerm;
  final String? language;
  final int? page;
  final bool? includeAdult;

  const SearchQueries({
    required this.searchTerm,
    this.language = 'en-US',
    this.page = 1,
    this.includeAdult = false,
  });

  @override
  List<Object?> get props => [
        searchTerm,
        language,
        page,
        includeAdult,
      ];

  @override
  bool get stringify => true;
}
