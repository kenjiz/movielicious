import 'package:equatable/equatable.dart';

abstract class MovieQueries extends Equatable {
  final int? page;
  final String? language;

  const MovieQueries({
    this.page = 1,
    this.language = 'en-US',
  });

  @override
  List<Object?> get props => [
        page,
        language,
      ];

  @override
  bool get stringify => true;
}
