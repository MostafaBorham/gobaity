import 'package:yallabaity/domain/entities/requests_entites/food_view_and_order.dart';
import 'package:yallabaity/domain/entities/response_entities/food_view_and_order_response.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/food_view_and_order_model.dart';

class FoodViewAndOrderResponseModel extends FoodViewAndOrderResponseEntity {
  FoodViewAndOrderResponseModel({FoodViewAndOrderModel? data, bool? state, String? message})
      : super(food: data, state: state, message: message);
  factory FoodViewAndOrderResponseModel.fromJson(Map<String,dynamic> json)=>FoodViewAndOrderResponseModel(
    message: json['message'],
    state: json['state'],
    data: json['data'] !=null?FoodViewAndOrderModel.fromJson(json['data']):null
  );
  Map<String,dynamic> toJson()=>{
    'message':message,
    'state':state,
    'data':food!.fromEntityToModel().toJson()
  };
}
