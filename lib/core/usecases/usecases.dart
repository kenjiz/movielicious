import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}

abstract class UseCaseWithParams<T, P> {
  Future<Either<Failure, T>> call(P params);
}
