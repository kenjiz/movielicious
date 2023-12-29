import 'package:movielicious/src/features/errors/domain/models/request_error.dart';

class ApiRequestError implements RequestError {
  final Object error;
  final StackTrace stackTrace;

  const ApiRequestError({
    required this.error,
    required this.stackTrace,
  });

  @override
  String get message => 'Api request error.';
}
