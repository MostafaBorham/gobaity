
import '../../../domain/entities/requests_entites/size_entity.dart';

class SizeModel extends SizeEntity {
  int? quantity;
  bool? isAdding;
  SizeModel({
    this.quantity = 1,
    this.isAdding = false,
    int? foodsSizesId,
    double? price,
    String? sizeDescription,
    String? sizeName,
    int? foodId,
  }) : super(sizeId: foodsSizesId, price: price, sizeDescription: sizeDescription, foodId: foodId, sizeName: sizeName);

  SizeModel.fromJson(Map<String, dynamic> json) {
    sizeId = json['sizeId'];
    price = json['price'];
    sizeDescription = json['sizeDescription'];
    sizeName = json['sizeName'];
    foodId = json['foodId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sizeId'] = sizeId;
    data['price'] = price;
    data['sizeDescription'] = sizeDescription;
/*    data['sizeName'] = this.sizeName;
    data['foodId'] = this.foodId;*/
    return data;
  }

  Map<String, String> toMultiPart() {
    final Map<String, String> data = {};
    data["sizeId"] = sizeId!.toString();
    data["price"] = price!.toString();
    data["sizeDescription"] = sizeDescription!;
    return data;
  }
}
