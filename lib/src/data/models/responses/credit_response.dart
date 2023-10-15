import 'package:equatable/equatable.dart';

import '../../../data/models/credit_model.dart';

class CreditResponseModel extends Equatable {
  final int id;
  final List<CreditModel> cast;
  const CreditResponseModel({
    required this.id,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory CreditResponseModel.fromMap(Map<String, dynamic> map) {
    return CreditResponseModel(
      id: map['id'] as int,
      cast: List<CreditModel>.from(
        (map['cast'] as List).map<CreditModel>(
          (x) => CreditModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        cast,
      ];
}
