import 'package:yallabaity/application/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:yallabaity/domain/entities/response_entities/foods_respnse_entity.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';

class FoodsResponseModel extends FoodsResponseEntity {
  FoodsResponseModel({bool? state, String? message, List<FoodModel>? data}) : super(state: state, message: message, data: data);
  @override
  List<FoodModel>? get data => super.data!.map((e) => e.toDomian()).toList();
  factory FoodsResponseModel.fromJson(Map<String, dynamic> json) => FoodsResponseModel(
      state: json['state'],
      message: json['message'],
      data: json['data'] != null ? (json['data'] as List<dynamic>).map((e) => FoodModel.fromJson(e)).toList() : null);
  Map<String, dynamic> toJson() => {'state': state, 'message': message, 'data': data!.map((e) => e.toJson()).toList()};
}
