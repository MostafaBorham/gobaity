import 'package:yallabaity/domain/entities/requests_entites/size_entity.dart';

class FoodPostEntity {
  int? foodId;
  String? foodName;
  double? price;
  String? description;
  int? userId;
  String? latitude;
  String? longitude;
  List<String>? images;
  List<SizeEntity>? sizes;
  List<int>? categories;

  FoodPostEntity({
    this.foodId,
    this.foodName,
    this.price,
    this.description,
    this.userId,
    this.latitude,
    this.longitude,
    this.images,
    this.sizes,
    this.categories,
  });
}

class FoodSizes {
  String? sizeId;
  String? price;
  String? sizeDescription;

  FoodSizes({
    this.sizeId,
    this.price,
    this.sizeDescription,
  });
}
