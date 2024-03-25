import 'package:flutter/foundation.dart';
import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';

class MovieReviewsError extends ApiRequestError {
  const MovieReviewsError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => kDebugMode;
}
