
import 'package:yallabaity/domain/entities/requests_entites/review_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/size_entity.dart';

import 'category_entity.dart';
import 'food_entity.dart';
import 'image_entity.dart';

class FoodViewAndOrderEntity{
  List<SizeEntity>? sizes;
  FoodEntity? food;
  List<ImageEntity>? images;
  List<CategoryEntity>? categories;
  List<ReviewEntity>? reviews;

  FoodViewAndOrderEntity({this.sizes, this.food, this.images, this.categories, this.reviews});
}