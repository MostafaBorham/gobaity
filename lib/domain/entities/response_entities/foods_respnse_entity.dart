import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

import '../requests_entites/food_entity.dart';

class FoodsResponseEntity extends ResponseEntity{
  List<FoodEntity>? data;
  FoodsResponseEntity({this.data,bool? state, String? message}):super(state: state,message: message);
}