import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/foods_respnse_entity.dart';
import 'package:yallabaity/domain/use_cases/foods_usecases.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_get_params_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';

import '../../../application/app_failures/failures.dart';
import '../../../application/app_failures/map_failure_to_massage.dart';


import '../../../domain/entities/response_entities/cook_foods_response_entity.dart';
import '../../../network_layer/models/data_models/food_model.dart';
import '../cubit_cooks_managers/cubit_cooks_manager_cubit.dart';

part 'cubit_cook_foods_manager_state.dart';

class CookFoodsManagerCubit extends Cubit<CookFoodsManagerState> {
  final FoodsUseCases foodsUseCase;
  List<FoodEntity> foods = [];
  FoodsGetParamsModel? foodGetParamsFromServer;
  int page = 0;
  CookFoodsManagerCubit({required this.foodsUseCase}) : super(CookFoodsManagerInitial());

  getCookFoods({required CookGetParamsModel cookGetParams}) async {
    emit(CookFoodsLoadingState());
    Either<Failure, CookFoodsResponseEntity> either = await foodsUseCase.getCookFoods(cookGetParams);
    either.fold(
        (Failure failure) => emit(CookFoodsErrorState(message: mapFailureToMessage(failure))),
        (CookFoodsResponseEntity cookFoodsResponse) =>
            emit(CookFoodsLoadedState(cookFoods: cookFoodsResponse.data!.map((e) => e.toDomian()).toList())));
  }

  getCookMoreFoods() async {
    if (state is CookFoodsLoadedState) {
      emit(CookLoadingMoreFoodsState(foods: foods));
      foodGetParamsFromServer!.page = foodGetParamsFromServer!.page! + 1;
      Either<Failure, FoodsResponseEntity> either = await foodsUseCase.getAll(foodsGetParams: foodGetParamsFromServer!);
      either.fold((Failure failure) => emit(CookFoodsErrorState(message: mapFailureToMessage(failure))),
              (FoodsResponseEntity foodsResponse) {
            if (foodsResponse.data!.isEmpty) {
              emit(CookAllFoodAreLoaded(foods: foods));
            } else {
              foods.addAll(foodsResponse.data!);
              emit(CookFoodsLoadedState(cookFoods: []));
            }
          });
    }
  }

  static getCookMoreFoodsEvent(BuildContext context) {
    BlocProvider.of<CookFoodsManagerCubit>(context).getCookMoreFoods();
  }

  static getCookFoodsEvent(BuildContext context, {required CookGetParamsModel cookGetParams}) =>
      BlocProvider.of<CookFoodsManagerCubit>(context).getCookFoods(cookGetParams: cookGetParams);
}
