import 'package:yallabaity/domain/entities/response_entities/ads_response_entity.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/ad_model.dart';

class AdsResponseModel extends AdsResponseEntity {
  AdsResponseModel({List<AdsModel>? data, bool? state, String? message}) : super(data: data, state: state, message: message);
  factory AdsResponseModel.fromJson(Map<String, dynamic> json) => AdsResponseModel(
        data: json['data'] != null ? (json['data'] as List<dynamic>).map((e) => AdsModel.fromJson(e)).toList() : null,
        message: json['message'],
        state: json['state'],
      );
  Map<String, dynamic> toJson() =>
      {'data': data != null ? data!.map((e) => e.toJson()).toList() : null, 'message': message, 'state': state};
  @override
  List<AdsModel>? get data => super.data != null ? super.data!.map((e) => e.fromEntityToModel()).toList() : null;
}
