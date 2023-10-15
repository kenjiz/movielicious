import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.properties = const []]);
  final List properties;

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure {}
