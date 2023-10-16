import 'package:equatable/equatable.dart';

import '../entities.dart';

abstract class ReviewResponse extends Equatable {
  final int? page;
  final List<Review> results;
  final int totalPages;
  final int totalResults;

  const ReviewResponse({
    this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
