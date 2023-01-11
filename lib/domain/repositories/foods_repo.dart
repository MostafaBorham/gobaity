import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/cook_foods_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/food_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/food_view_and_order_response.dart';
import 'package:yallabaity/domain/entities/response_entities/foods_respnse_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_post_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/foods_response_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/response_model.dart';

import '../entities/requests_entites/cook_get_params.dart';


abstract class FoodsRepo {
  Future<Either<Failure, FoodsResponseModel>> getAll({required FoodsGetParamsModel foodsGetParams});

  Future<Either<Failure, ResponseEntity>> add(FoodPostModel food);
  Future<Either<Failure, ResponseModel>> delete(int id);
  Future<Either<Failure, FoodViewAndOrderResponseEntity>> get(int id);
  Future<Either<Failure, ResponseModel>> update(FoodModel food);
  Future<Either<Failure,CookFoodsResponseEntity>> getCookFoods({required CookGetParamsEntity cookGetParams});


}
