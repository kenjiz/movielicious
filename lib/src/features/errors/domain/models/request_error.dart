import 'package:equatable/equatable.dart';

abstract class RequestError extends Equatable {
  String get message;

  @override
  List<Object?> get props => [message];
}
