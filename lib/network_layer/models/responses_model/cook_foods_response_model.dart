import 'package:yallabaity/domain/entities/response_entities/cook_foods_response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';

class CookFoodsResponseModel extends CookFoodsResponseEntity {
  CookFoodsResponseModel({bool? state, String? message, List<FoodModel>? cookFoods})
      : super(state: state, message: message, data: cookFoods);
  factory CookFoodsResponseModel.fromJson(Map<String, dynamic> json) => CookFoodsResponseModel(
      state: json['state'],
      message: json['message'],
      cookFoods: (json['data'] != null) ? (json['data'] as List<dynamic>).map((e) => FoodModel.fromJson(e)).toList() : null);
  Map<String,dynamic>toJson() => {'state': state, 'message': message, 'data': data!.map((e) => e.toDomian().toJson()).toList()};

}
