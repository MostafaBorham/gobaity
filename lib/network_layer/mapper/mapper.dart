import 'package:yallabaity/application/app_constants/app_constants.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/domain/entities/requests_entites/ads_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/cart_post_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/category_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/cook_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/cook_get_params.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_view_and_order.dart';
import 'package:yallabaity/domain/entities/requests_entites/image_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/review_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/size_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/cart_post_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/cook_foods_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/food_view_and_order_response.dart';
import 'package:yallabaity/network_layer/models/data_models/ad_model.dart';
import 'package:yallabaity/network_layer/models/data_models/cart_post_model.dart';
import 'package:yallabaity/network_layer/models/data_models/category_model.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_get_params_model.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_view_and_order_model.dart';
import 'package:yallabaity/network_layer/models/data_models/image_model.dart';
import 'package:yallabaity/network_layer/models/data_models/review_model.dart';
import 'package:yallabaity/network_layer/models/data_models/size_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/cart_post_response_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/cook_foods_response_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/food_view_and_order_response_model.dart';
export 'mapper.dart';

extension EntityMapper on FoodEntity {
  FoodModel toDomian() => FoodModel(
      userId: userId,
      foodId: foodId?.orZero,
      cookName: cookName.orEmpty,
      creationDate: creationDate.orEmpty,
      isApproved: isApproved,
      preparationTime: preparationTime.orZero,
      description: description.orEmpty,
      foodName: foodName.orEmpty,
      serial: serial.orZero,
      latitude: latitude.orZero,
      longitude: longitude.orZero,
      price: price.orZero,
      imagePath: imagePath.orEmpty,
      isFavorited: isFavorited.orFalse,
      date: date.orEmpty,
      rate: rate.orZero,
      rateCount: rateCount.orZero);
}

extension AdsEntityMapper on AdsEntity {
  AdsModel fromEntityToModel() => AdsModel(adsImage: adsImage.toString(), adsId: adsId.orZero);
}

extension CookEntityMapper on CookEntity {
  CookModel fromEntityToModel() => CookModel(
        cookName: cookName.orEmpty,
        rateCount: rateCount.orZero,
        gender: gender.orFalse,
        cookId: cookId.orZero,
        rate: rate.orZero,
      );
}

extension ReviewEntityMapper on ReviewEntity {
  ReviewModel fromEntityToModel() => ReviewModel(
        foodId: foodId.orZero,
        userId: userId.orZero,
        userName: userName.orEmpty,
        description: description.orEmpty,
        rating: rating.orZero,
        ratingDate: ratingDate.orEmpty,
        userRatingId: userRatingId.orZero,
      );
}

extension CategoryEntityMapper on CategoryEntity {
  CategoryModel get fromEntityToModel => CategoryModel(
      imagePath: imagePath,
      categoryName: categoryName,
      categoryId: categoryId,
      categoryDescription: categoryDescription,
      backgroundColor: backgroundColor);
}

extension SizeEntityMapper on SizeEntity {
  SizeModel fromEntityToModel() => SizeModel(
        foodId: foodId.orZero,
        sizeName: sizeName.toString(),
        price: price.orZero,
        foodsSizesId: sizeId.orZero,
        sizeDescription: sizeDescription.orEmpty,
      );
}

extension ImageEntityMapper on ImageEntity {
  ImageModel fromEntityToModel() => ImageModel(
        imagePath: imagePath,
        foodId: foodId,
        foodsImagesId: foodsImagesId,
      );
}

extension FoodViewAndOrderEntityMapper on FoodViewAndOrderEntity {
  FoodViewAndOrderModel fromEntityToModel() => FoodViewAndOrderModel(
        food: food != null ? food!.toDomian() : FoodModel(),
        reviews: reviews != null ? reviews!.map((e) => e.fromEntityToModel()).toList() : [],
        categories: categories != null ? categories!.map((e) => e.fromEntityToModel).toList() : [],
        sizes: sizes != null ? sizes!.map((e) => e.fromEntityToModel()).toList() : [],
        images: images != null ? images!.map((e) => e.fromEntityToModel()).toList() : [],
      );
}

extension FoodViewAndOrderResponseEntityMapper on FoodViewAndOrderResponseEntity {
  FoodViewAndOrderResponseModel fromEntityToModel() => FoodViewAndOrderResponseModel(
        state: state,
        data: food != null ? food!.fromEntityToModel() : null,
        message: message,
      );
}

extension CookGetParamsMapper on CookGetParamsEntity {
  CookGetParamsModel fromEntityToModel() => CookGetParamsModel(providerId: providerId, order: order,foodName: foodName);
}

extension CookFoodsResponseMapper on CookFoodsResponseEntity {
  CookFoodsResponseModel fromEntityToModel() =>
      CookFoodsResponseModel(state: state, message: message, cookFoods: data!.map((e) => e.toDomian()).toList());
}

extension CartPostEntityMapper on CartPostEntity {
  CartPostModel get fromEntityToModel => CartPostModel(
        foodId: foodId.orZero,
       foodsSizesId: foodsSizesId,
    quantity: quantity
      );
}



extension CartPostResponseMapper on CartPostResponseEntity {
  CartPostResponseModel get fromEntityToModel => CartPostResponseModel(message: message, state: state,data: data);
}
