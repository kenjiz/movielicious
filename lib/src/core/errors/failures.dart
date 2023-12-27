import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ServerFailure extends Failure {
  final int? code;
  final String message;

  const ServerFailure({
    required this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [code, message];
}
