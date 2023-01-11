import 'package:yallabaity/domain/entities/requests_entites/food_get_params.dart';

class FoodsGetParamsModel extends FoodsGetParamsEntity {
  FoodsGetParamsModel({
    int page = 0,
    int size = 30,
    String? order,
    String? foodName,
    int categoryId = -1,
  }) : super(page: page, size: size, categoryId: categoryId, order: order, foodName: foodName);
  Map<String, dynamic> toJson() => {
        'page': page.toString(),
        'size': size.toString(),
        'categoryId': categoryId.toString(),
        'order': order,
        'foodName': foodName
      };
}
