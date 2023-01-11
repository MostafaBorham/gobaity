

import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/review_model.dart';
import 'package:yallabaity/network_layer/models/data_models/size_model.dart';

import '../../../domain/entities/requests_entites/food_view_and_order.dart';
import 'category_model.dart';
import 'food_model.dart';
import 'image_model.dart';

class FoodViewAndOrderModel extends FoodViewAndOrderEntity {
  FoodViewAndOrderModel({
    List<SizeModel>? sizes,
    FoodModel? food,
    List<ImageModel>? images,
    List<CategoryModel>? categories,
    List<ReviewModel>? reviews,
  }) : super(food: food, images: images, categories: categories, sizes: sizes, reviews: reviews);
  factory FoodViewAndOrderModel.fromJson(Map<String, dynamic> json) => FoodViewAndOrderModel(
        food: json['food'] != null ? FoodModel.fromJson(json['food']) : null,
        sizes: json['sizes'] != null ? (json['sizes'] as List<dynamic>).map((e) => SizeModel.fromJson(e)).toList() : null,
        images: json['images'] != null ? (json['images'] as List<dynamic>).map((e) => ImageModel.fromJson(e)).toList() : null,
        categories: json['categories'] != null
            ? (json['categories'] as List<dynamic>).map((e) => CategoryModel.fromJson(e)).toList()
            : null,
        reviews: json['reviews'] != null ? (json['reviews'] as List<dynamic>).map((e) => ReviewModel.fromJson(e)).toList() : null,
      );

  Map<String, dynamic> toJson() => {
        'food': food!.toDomian().toJson(),
        'sizes': sizes!.map((e) => e.fromEntityToModel().toJson()).toList(),
        'images': images!.map((e) => e.fromEntityToModel().toJson()).toList(),
        'reviews': reviews!.map((e) => e.fromEntityToModel().toJson()).toList(),
        'categories': categories!.map((e) => e.fromEntityToModel.toJson()).toList(),
      };
  @override
  List<SizeModel>? get sizes=>super.sizes!.map((e) => e.fromEntityToModel()).toList();
  @override
  List<ReviewModel>? get reviews=>super.reviews!.map((e) => e.fromEntityToModel()).toList();
}
