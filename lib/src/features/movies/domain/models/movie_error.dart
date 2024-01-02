import 'package:flutter/foundation.dart';

import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';

class MovieError extends ApiRequestError {
  final String errorMessage;

  MovieError({
    required this.errorMessage,
  });

  @override
  String get message => errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  bool? get stringify => kDebugMode;
}
