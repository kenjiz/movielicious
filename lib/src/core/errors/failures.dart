// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ServerFailure extends Failure {
  final int? statusCode;
  final String? statusMessage;

  const ServerFailure({
    required this.statusCode,
    required this.statusMessage,
  });

  @override
  List<Object?> get props => [statusCode, statusMessage];
}
