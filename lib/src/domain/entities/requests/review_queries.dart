import 'package:equatable/equatable.dart';

abstract class ReviewQueries extends Equatable {
  final int? page;
  final String? language;

  const ReviewQueries({
    this.page = 1,
    this.language = 'en-US',
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        page,
        language,
      ];
}
