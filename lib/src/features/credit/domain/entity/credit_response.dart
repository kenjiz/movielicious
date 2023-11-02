import 'package:equatable/equatable.dart';

import 'credit.dart';

class CreditResponse extends Equatable {
  final int id;
  final List<Credit> cast;

  const CreditResponse({
    required this.id,
    required this.cast,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        cast,
      ];
}
