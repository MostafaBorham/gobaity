import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yallabaity/application/types.dart';
import 'package:yallabaity/domain/entities/response_entities/cook_foods_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/food_view_and_order_response.dart';
import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';
import 'package:yallabaity/domain/repositories/foods_repo.dart';
import 'package:yallabaity/network_layer/data_sources/food_local_datasource.dart';
import 'package:yallabaity/network_layer/data_sources/food_remote_datasource.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
/*
import 'package:yallabaity/network_layer/models/foods/food_post_model.dart';
*/
import 'package:yallabaity/application/network.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_post_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_view_and_order_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/cook_foods_response_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/food_view_and_order_response_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/foods_response_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/response_model.dart';

import '../../domain/entities/requests_entites/cook_get_params.dart';
/*
import 'package:yallabaity/network_layer/models/foods/foods_response_model.dart';
*/

class FoodRepoImpl extends FoodsRepo {
  final FoodsRemoteDataSource foodsRemoteDataSource;
  final FoodsLocalDataSource foodsLocalDataSource;
  final NetworkStatus networkStatus;
  FoodRepoImpl({
    required this.foodsRemoteDataSource,
    required this.foodsLocalDataSource,
    required this.networkStatus,
  });
  @override
  Future<Either<Failure, ResponseModel>> add(FoodPostModel food) => operation(crud: () => foodsRemoteDataSource.addFood(food));

  @override
  Future<Either<Failure, ResponseModel>> delete(int id) => operation(crud: () => foodsRemoteDataSource.deleteFood(id));

  @override
  Future<Either<Failure, ResponseModel>> update(FoodModel food) => operation(crud: () => foodsRemoteDataSource.updateFood(food));

  @override
  Future<Either<Failure, FoodsResponseModel>> getAll({required FoodsGetParamsModel foodsGetParams}) async {
    if (await networkStatus.isConnected) {
      try {
        /* remote data source */
        final FoodsResponseModel foodsResponse = await foodsRemoteDataSource.getAll(foodsGetParams: foodsGetParams);
        foodsLocalDataSource.cacheFoods(foodsResponse);
        return Right(foodsResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /* in case internet not connected */
      /*local data source*/
      try {
        final localFoods = await foodsLocalDataSource.getCachedFoods();
        return Right(localFoods);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
    try {
      foodsRemoteDataSource.getAll(foodsGetParams: foodsGetParams);
    } on EmptyCashException {}

    /* in case internet connected
    *  we will use internet_connection_checker: package to check internet connectivity
    *  */
/*    if (await networkStatus.isConnected) {
      try {
        */ /* remote data source */ /*
        final remotefoods = await FoodsRemoteDataSource.getAll();
        categoriesLocalDataSource.cacheCategories(remoteCategories);
        return Right(remoteCategories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      */ /* in case internet not connected */ /*
      */ /*local data source*/ /*
      try {
        final localCategories =
            await categoriesLocalDataSource.getCachedCategories();
        return Right(localCategories);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }*/
    throw UnimplementedError();
  }

  Future<Either<Failure, ResponseModel>> operation({required FutureResponseModelFun crud}) async {
    if (await networkStatus.isConnected) {
      try {
        ResponseModel responseModel = await crud();
        return Right(responseModel);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, FoodViewAndOrderResponseModel>> get(int id) async {
    if (await networkStatus.isConnected) {
      try {
        FoodViewAndOrderResponseModel foodViewAndOrderResponse = await foodsRemoteDataSource.getFood(id);
        try {
          foodsLocalDataSource.cacheFoodWithId(id, foodViewAndOrderResponse);
        } on WritingCashException {
          return Left(WritingCashFailure());
        }
        return Right(foodViewAndOrderResponse);
      } on InvalidPermissionException {
        return Left(InvalidRequestFailure());
      }
    } else {
      /*get data from local data source*/
      try {
        FoodViewAndOrderResponseModel foodViewAndOrderResponse = await foodsLocalDataSource.getCachedFoodWithId(id);
        return Right(foodViewAndOrderResponse);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CookFoodsResponseEntity>> getCookFoods({required CookGetParamsEntity cookGetParams}) async {
    if (await networkStatus.isConnected) {
      try {
        /* remote data source */
        final CookFoodsResponseModel cookFoodsResponse =
            await foodsRemoteDataSource.getCookFoods(cookGetParams: cookGetParams.fromEntityToModel());
        foodsLocalDataSource.cacheCookFoods(cookGetParams.providerId!, cookFoodsResponse);
        return Right(cookFoodsResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /* in case internet not connected */
      /*local data source*/
      try {
        final localCookFoods = await foodsLocalDataSource.getCachedCookFoods(cookGetParams.providerId!);
        return Right(localCookFoods);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
  }
}
