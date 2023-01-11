
import '../../../domain/entities/requests_entites/cook_entity.dart';

class CookModel extends CookEntity {
  CookModel({
    int? cookId,
    String? cookName,
    bool? gender,
    int? rateCount,
    double? rate,
  }) : super(cookId: cookId, cookName: cookName, gender: gender, rate: rate, rateCount: rateCount);
  CookModel.fromJson(Map<String, dynamic> json) {
    cookId = json['cookId'] ?? '';
    cookName = json['cookName'] ?? '';
    gender = json['gender'] ?? false;
    rateCount = json['rateCount'] ?? 0;
    rate = json['rate']!=null?double.parse(json['rate'].toString()):0.0;
  }

  get rateCount => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cookId'] = cookId;
    data['cookName'] = cookName;
    data['gender'] = gender;
    data['rateCount'] = rateCount;
    data['rate'] = rate;
    return data;
  }

}
