import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../errors/failures.dart';

abstract class BaseApiRepository {
  const BaseApiRepository();

  /// This method is responsible of handling the given 'request', in which
  /// returns [Either<F, T>] with [Failure] at left and generic T at [Right].
  ///
  /// Return [Right<T>] that holds the generic data 'T' if the response
  /// is successfully received.
  ///
  /// Returns [Left<F>] that holds a [ServerFailure] instance if any error
  /// occurs while sending the request or receiving the response.
  @protected
  Future<Either<ServerFailure, T>> getStateOf<T>({
    required Future<T> Function() request,
  }) async {
    try {
      final response = await request();
      return Right(response);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          code: e.response?.statusCode,
          message: e.response?.statusMessage ?? 'Server error occured',
        ),
      );
    }
  }

  @protected
  TaskEither<ServerFailure, T> processRequest<T>({
    required Future<T> Function() request,
  }) {
    return TaskEither.tryCatch(() => request(), (e, st) {
      print(st);
      return ServerFailure(
        code: 500,
        message: e.toString(),
      );
    });
  }
}
