import 'package:yallabaity/domain/entities/response_entities/cooks_response_entity.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_model.dart';

class CooksResponseModel extends CooksResponseEntity {
  CooksResponseModel({List<CookModel>? cooks, String? message, bool? state})
      : super(
          state: state,
          message: message,
          data: cooks,
        );
  factory CooksResponseModel.fromJson(Map<String, dynamic> json) =>CooksResponseModel(
    state: json['state'],
    message: json['message'],
    cooks: json['data'] != null?(json['data'] as List<dynamic>).map((e) => CookModel.fromJson(e)).toList():null
  );


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['state'] = state;
    json['data'] = data!.map((cook) => cook.toJson()).toList();
    return json;
  }

  @override
  List<CookModel>? get data => super.data != null ? super.data!.map((e) => e.fromEntityToModel()).toList() : null;
}
