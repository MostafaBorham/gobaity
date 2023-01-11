import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/network_layer/models/data_models/food_post_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/food_view_and_order_response_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/foods_response_model.dart';

import '../../application/app_failures/exception.dart';
import '../models/responses_model/cook_foods_response_model.dart';

abstract class FoodsLocalDataSource {
  Future<void> addFood(FoodPostModel food);
  Future<void> updateFood(FoodPostModel food);
  Future<void> deleteFood(int id);
  FoodsResponseModel getCachedFoods();
  Future<Unit> cacheFoods(FoodsResponseModel foodsResponse);
  Future<Unit> cacheFoodWithId(int id, FoodViewAndOrderResponseModel foodViewAndOrderResponse);
  Future<FoodViewAndOrderResponseModel> getCachedFoodWithId(int id);
  Future<Unit> cacheCookFoods(int id, CookFoodsResponseModel cooksFoodsResponse);
  Future<CookFoodsResponseModel> getCachedCookFoods(int id);
}

class FoodsImplWithPrefs implements FoodsLocalDataSource {
  final SharedPreferences preferences;
  final String foodsKey = 'CACHED_FOODS';
  final String foodIdKey = 'CACHE_FOOD_WITH_ID';
  final String cookFoodsKey = 'CACHED_COOKS_Foods';

  FoodsImplWithPrefs({
    required this.preferences,
  });
  @override
  Future<void> addFood(FoodPostModel food) {
    // TODO: implement addFood
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFood(int id) {
    // TODO: implement deleteFood
    throw UnimplementedError();
  }

  @override
  FoodsResponseModel getCachedFoods() {
    String? cashedFoods = preferences.getString(foodsKey);
    if (cashedFoods != null) {
      return FoodsResponseModel.fromJson(cashedFoods.fromStringToJson);
    } else {
      throw EmptyCashException();
    }
  }

  @override
  Future<void> updateFood(FoodPostModel food) {
    // TODO: implement updateFood
    throw UnimplementedError();
  }

  @override
  Future<Unit> cacheFoods(FoodsResponseModel foodsResponse) async {
    String foodsString = foodsResponse.toJson().fromJsonToString;
    await preferences.setString(foodsKey, foodsString);
    return unit;
  }

  @override
  Future<Unit> cacheFoodWithId(int id, FoodViewAndOrderResponseModel foodViewAndOrderResponse) async {
    try {
      bool isSaved = await preferences.setString(foodIdKey + id.toString(), foodViewAndOrderResponse.toJson().fromJsonToString);
      if (isSaved) return unit;
    } catch (e) {
    }

    throw WritingCashException();
  }

  @override
  Future<FoodViewAndOrderResponseModel> getCachedFoodWithId(int id) async {
    String? savedFoodString = preferences.getString(foodIdKey + id.toString());
    if (savedFoodString != null) {
      FoodViewAndOrderResponseModel foodViewAndOrderResponse =
          FoodViewAndOrderResponseModel.fromJson(savedFoodString.fromStringToJson);
      return foodViewAndOrderResponse;
    } else {
      throw EmptyCashException();
    }
  }

  @override
  Future<Unit> cacheCookFoods(int id, CookFoodsResponseModel cooksFoodsResponse) async {
    try {
      bool isSaved = await preferences.setString(cookFoodsKey + id.toString(), cooksFoodsResponse.toJson().fromJsonToString);
      if (isSaved) return unit;
    } catch (e) {
    }

    throw WritingCashException();
  }

  @override
  Future<CookFoodsResponseModel> getCachedCookFoods(int id) async {
    String? savedCookFoodsString = preferences.getString(cookFoodsKey + id.toString());
    if (savedCookFoodsString != null) {
      CookFoodsResponseModel cookFoodsResponse = CookFoodsResponseModel.fromJson(savedCookFoodsString.fromStringToJson);
      return cookFoodsResponse;
    } else {
      throw EmptyCashException();
    }
  }
}
