

import '../../../domain/entities/requests_entites/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel._internal();
  CategoryModel({
    int? categoryId,
    String? categoryName,
    String? categoryDescription,
    String? backgroundColor,
    String? imagePath,
  }) : super(
      categoryId: categoryId,
      categoryName: categoryName,
      categoryDescription: categoryDescription,
      imagePath: imagePath,
      backgroundColor: backgroundColor);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryDescription = json['categoryDescription'];
    backgroundColor = json['backgroundcolor'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['categoryDescription'] = categoryDescription;
    data['backgroundcColor'] = backgroundColor;
    data['imagePath'] = imagePath;
    return data;
  }
}
