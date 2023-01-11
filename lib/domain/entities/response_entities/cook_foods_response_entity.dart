import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

import '../requests_entites/food_entity.dart';

class CookFoodsResponseEntity extends ResponseEntity{
  final List<FoodEntity>? data;
  CookFoodsResponseEntity({this.data,bool? state,String? message}):super(message: message,state: state);

}