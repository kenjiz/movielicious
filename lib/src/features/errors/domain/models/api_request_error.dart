import 'package:flutter/foundation.dart';

import 'package:movielicious/src/features/errors/domain/models/request_error.dart';

class ApiRequestError implements RequestError {
  final Object? error;
  final StackTrace? stackTrace;

  const ApiRequestError({
    this.error,
    this.stackTrace,
  });

  @override
  List<Object?> get props => [error, stackTrace];

  @override
  bool? get stringify => kDebugMode;
}
