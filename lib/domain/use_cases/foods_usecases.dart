import 'package:dartz/dartz.dart';
import 'package:yallabaity/domain/entities/requests_entites/cook_get_params.dart';
import 'package:yallabaity/domain/entities/response_entities/cook_foods_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/food_view_and_order_response.dart';
import 'package:yallabaity/domain/entities/response_entities/foods_respnse_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';
import 'package:yallabaity/domain/repositories/foods_repo.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_post_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/foods_response_model.dart';


/*
import 'package:yallabaity/network_layer/models/foods/food_post_model.dart';
*/

class FoodsUseCases {
  final FoodsRepo foodsRepo;

  const FoodsUseCases({
    required this.foodsRepo,
  });
  Future<Either<Failure, ResponseEntity>> add(FoodPostModel food) async => await foodsRepo.add(food);
  Future<Either<Failure, FoodsResponseEntity>> getAll({required FoodsGetParamsModel foodsGetParams}) async =>
      await foodsRepo.getAll(foodsGetParams: foodsGetParams);
  Future<Either<Failure, ResponseEntity>> delete(int id) async => await foodsRepo.delete(id);
  Future<Either<Failure, FoodViewAndOrderResponseEntity>> get(int id) async => await foodsRepo.get(id);
  Future<Either<Failure, ResponseEntity>> update(FoodModel food) async => await foodsRepo.update(food);
  Future<Either<Failure, CookFoodsResponseEntity>> getCookFoods(CookGetParamsEntity cookGetParamsEntity) =>
      foodsRepo.getCookFoods(cookGetParams: cookGetParamsEntity);
  Future<Either<Failure,FoodViewAndOrderResponseEntity>> getTopRatedCookFood(int cookId)async=>await foodsRepo.get(cookId);
}
