import '../../../data/models/credit_model.dart';
import '../../../domain/entities/responses/credit_response.dart';

class CreditResponseModel extends CreditResponse {
  const CreditResponseModel({
    required super.id,
    required super.cast,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cast': cast.map((x) => (x as CreditModel).toMap()).toList(),
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
}
