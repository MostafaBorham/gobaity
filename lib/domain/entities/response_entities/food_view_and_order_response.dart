import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';
import '../requests_entites/food_view_and_order.dart';

class FoodViewAndOrderResponseEntity extends ResponseEntity {
  FoodViewAndOrderEntity? food;
  FoodViewAndOrderResponseEntity({this.food, bool? state, String? message}) : super(message: message, state: state);
}
