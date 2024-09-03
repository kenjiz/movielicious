import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import 'package:movielicious/src/features/errors/domain/models/api_request_error.dart';

abstract class BaseApiRepository {
  const BaseApiRepository();

  @protected
  TaskEither<ApiRequestError, T> processRequest<T>({
    required Future<T> Function() request,
  }) {
    return TaskEither.tryCatch(
      () => request(),
      (e, st) {
        if (kDebugMode) {
          log(e.toString());
          log(st.toString());
        }

        return ApiRequestError(
          error: e,
          stackTrace: st,
        );
      },
    );
  }

  ApiRequestError transformError(ApiRequestError e);
}
