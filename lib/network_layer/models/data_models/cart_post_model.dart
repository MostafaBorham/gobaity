import 'package:yallabaity/domain/entities/requests_entites/cart_post_entity.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';

class CartPostModel extends CartPostEntity {
  CartPostModel({
    int? foodId,
    int? foodsSizesId,
    int? quantity,
  }) : super(foodId: foodId, quantity: quantity, foodsSizesId: foodsSizesId);

  CartPostModel.fromJson(Map<String, dynamic> json) {
    foodId = json['FoodId'];
    foodsSizesId = json['FoodsSizesId'];
    quantity = json['Quantity'];
  }

  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FoodId'] = foodId;
    data['FoodsSizesId'] = foodsSizesId;
    data['Quantity'] = quantity;
    return data;
  }
}
