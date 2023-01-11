

import 'package:yallabaity/domain/entities/requests_entites/category_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/image_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/review_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/image_entity.dart';

class FoodEntity {
  int? serial;
  int? foodId;
  String? foodName;
  double? price;
  String? description;
  int? preparationTime;
  int? userId;
  bool? isApproved;
  String? creationDate;
  String? cookName;
  double? latitude;
  double? longitude;
  String? placeName;
  String? imagePath;
  double? rate;
  int? rateCount;
  bool? isFavorited;
  String? date;
  List<ImageEntity>? images;
  List<CategoryEntity>? categories;
  List<ReviewEntity>? reviews;
  List<SimilarFoods>? similarFoods;
  List<FoodSizes>? sizes;

  FoodEntity(
      {this.serial,
        this.foodId,
        this.foodName,
        this.price,
        this.description,
        this.preparationTime,
        this.userId,
        this.isApproved,
        this.creationDate,
        this.cookName,
        this.latitude,
        this.longitude,
        this.imagePath,
        this.rate,
        this.rateCount,
        this.placeName,
        this.isFavorited,
        this.date,
      this.categories,
        this.images,
        this.sizes
      });



}



class SimilarFoods {
  int? serial;
  int? foodId;
  String? foodName;
  int? price;
  String? description;
  int? preparationTime;
  int? userId;
  bool? isApproved;
  bool? isDelete;
  bool? isActive;
  String? userName;
  String? latitude;
  String? longitude;
  String? imagePath;
  int? rateCount;
  int? mostPopular;
  int? mostWatched;
  bool? isLike;

  SimilarFoods(
      {this.serial,
        this.foodId,
        this.foodName,
        this.price,
        this.description,
        this.preparationTime,
        this.userId,
        this.isApproved,
        this.isDelete,
        this.isActive,
        this.userName,
        this.latitude,
        this.longitude,
        this.imagePath,
        this.rateCount,
        this.mostPopular,
        this.mostWatched,
        this.isLike});
/*
  SimilarFoods.fromJson(Map<String, dynamic> json) {
    serial = json['serial'];
    foodId = json['foodId'];
    foodName = json['foodName'];
    price = json['price'];
    description = json['description'];
    preparationTime = json['preparationTime'];
    userId = json['userId'];
    isApproved = json['isApproved'];
    isDelete = json['isDelete'];
    isActive = json['isActive'];
    userName = json['userName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    imagePath = json['imagePath'];
    rate = json['rate'];
    rateCount = json['rateCount'];
    mostPopular = json['mostPopular'];
    mostWatched = json['mostWatched'];
    isLike = json['isLike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serial'] = this.serial;
    data['foodId'] = this.foodId;
    data['foodName'] = this.foodName;
    data['price'] = this.price;
    data['description'] = this.description;
    data['preparationTime'] = this.preparationTime;
    data['userId'] = this.userId;
    data['isApproved'] = this.isApproved;
    data['isDelete'] = this.isDelete;
    data['isActive'] = this.isActive;
    data['userName'] = this.userName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['imagePath'] = this.imagePath;
    data['rate'] = this.rate;
    data['rateCount'] = this.rateCount;
    data['mostPopular'] = this.mostPopular;
    data['mostWatched'] = this.mostWatched;
    data['isLike'] = this.isLike;
    return data;
  }*/
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
