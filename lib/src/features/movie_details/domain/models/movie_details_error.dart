import 'package:flutter/foundation.dart';

import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';

class MovieDetailsError extends ApiRequestError {
  final String message;

  const MovieDetailsError({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => kDebugMode;
}
