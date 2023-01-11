import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/app_failures/map_failure_to_massage.dart';
import 'package:yallabaity/domain/entities/requests_entites/cook_get_params.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/food_view_and_order_response.dart';
import 'package:yallabaity/domain/entities/response_entities/foods_respnse_entity.dart';
import 'package:yallabaity/domain/use_cases/foods_usecases.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/foods_response_model.dart';

part 'foods_manager_state.dart';

class FoodsManagerCubit extends Cubit<FoodsManagerState> {
  final FoodsUseCases foodUseCases;
  List<FoodEntity> foods = [];
  int page = 0;
  FoodsGetParamsModel? foodGetParamsFromServer;
  FoodsManagerCubit({required this.foodUseCases}) : super(FoodsManagerInitial());
  getFoods({required FoodsGetParamsModel foodGetParams}) async {
    emit(FoodsLoadingState());
    foodGetParamsFromServer = foodGetParams;
    Either<Failure, FoodsResponseEntity> either = await foodUseCases.getAll(foodsGetParams: foodGetParams);
    emit(mapEventToState(either));
  }

  getFoodsRefresh() async {
    emit(FoodsLoadingState());
    foodGetParamsFromServer!.page = 0;
    Either<Failure, FoodsResponseEntity> either = await foodUseCases.getAll(foodsGetParams: foodGetParamsFromServer!);
    emit(mapEventToState(either));
  }

  getMoreFoods() async {
    if (state is FoodsLoadedState) {
      emit(LoadingMoreFoodsState(foods: foods));
      foodGetParamsFromServer!.page = foodGetParamsFromServer!.page! + 1;
      Either<Failure, FoodsResponseEntity> either = await foodUseCases.getAll(foodsGetParams: foodGetParamsFromServer!);
      either.fold((Failure failure) => emit(FoodsErrorState(message: mapFailureToMessage(failure))),
          (FoodsResponseEntity foodsResponse) {
        if (foodsResponse.data!.isEmpty) {
          emit(AllFoodAreLoaded(foods: foods));
        } else {
          foods.addAll(foodsResponse.data!);
          emit(FoodsLoadedState(foods: foods));
        }
      });
    }
  }

  FoodsManagerState mapEventToState(
    Either<Failure, FoodsResponseEntity> either,
  ) {
    FoodsManagerState? state;
    either.fold((Failure failure) => state = FoodsErrorState(message: mapFailureToMessage(failure)),
        (FoodsResponseEntity foodsResponse) {
      foods = foodsResponse.data!;
      return state = FoodsLoadedState(foods: foods);
    });
    return state!;
  }

  static getMoreFoodsEvent(BuildContext context) {
    BlocProvider.of<FoodsManagerCubit>(context).getMoreFoods();
  }

  static getFoodsEvent(BuildContext context, {required FoodsGetParamsModel foodGetParams}) {
    BlocProvider.of<FoodsManagerCubit>(context).getFoods(foodGetParams: foodGetParams);
  }

  static getFoodsRefreshEvent(BuildContext context) {
    BlocProvider.of<FoodsManagerCubit>(context).getFoodsRefresh();
  }

  getTopRatedCookFood({required int cookId})async{
    emit(FoodsLoadingState());
    final topRatedResult= await foodUseCases.getTopRatedCookFood(cookId);
    topRatedResult.fold((Failure failure) => emit(FoodsErrorState(message: mapFailureToMessage(failure))),
            (FoodViewAndOrderResponseEntity foodResponse) {
          if (foodResponse.food!=null) {
            emit(TopRatedCookFoodLoadedState(food: foodResponse.food!.food!));
          } else {
            emit(FoodsErrorState(message: 'No Top Rated Food For Cook !'));
          }
        });
  }
}