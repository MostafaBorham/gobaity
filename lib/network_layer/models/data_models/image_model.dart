
import '../../../domain/entities/requests_entites/image_entity.dart';

class ImageModel extends ImageEntity{
  ImageModel({  int? foodsImagesId,
  String? imagePath,
  int? foodId,}):super(imagePath: imagePath,foodId: foodId,foodsImagesId: foodsImagesId);

  ImageModel.fromJson(Map<String, dynamic> json) {
    foodsImagesId = json['foodsImagesId'];
    imagePath = json['imagePath'];
    foodId = json['foodId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodsImagesId'] = foodsImagesId;
    data['imagePath'] = imagePath;
    data['foodId'] = foodId;
    return data;
  }
}