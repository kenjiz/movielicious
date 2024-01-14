import 'package:flutter/foundation.dart';

import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';

class MovieError extends ApiRequestError {
  final String message;

  MovieError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => kDebugMode;
}
