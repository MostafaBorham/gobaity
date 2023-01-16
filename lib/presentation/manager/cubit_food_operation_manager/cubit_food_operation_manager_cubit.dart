import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/app_failures/map_failure_to_massage.dart';
import 'package:yallabaity/domain/entities/response_entities/food_view_and_order_response.dart';
import 'package:yallabaity/domain/use_cases/foods_usecases.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/food_view_and_order_model.dart';
import 'package:yallabaity/presentation/manager/cubit_foods/foods_manager_cubit.dart';

import '../../../domain/entities/response_entities/response_entity.dart';
import '../../../network_layer/models/data_models/food_model.dart';
import '../../../network_layer/models/data_models/food_post_model.dart';

part 'cubit_food_operation_manager_state.dart';

class FoodOperationManagerCubit extends Cubit<FoodOperationManagerState> {
  final FoodsUseCases foodsUseCase; //foods use case exists in domain layer
  FoodOperationManagerCubit({required this.foodsUseCase}) : super(FoodCreateOrReadOrUpdateOrDeleteLoadingState());
  getFoodById(int id) async {
    emit(FoodCreateOrReadOrUpdateOrDeleteLoadingState());
    Either<Failure, FoodViewAndOrderResponseEntity> either = await foodsUseCase.get(id);
    either.fold(
        (failure) => emit(FoodErrorState(message: mapFailureToMessage(failure))),
        (FoodViewAndOrderResponseEntity responseEntity) =>
            emit(FoodLoadedState(foodViewAndOrder: responseEntity.fromEntityToModel().food!.fromEntityToModel())));
  }

  addFood({required FoodPostModel food}) async {
    emit(AddOrUpdateOrDeleteFoodStartingState());
    Either<Failure, ResponseEntity> either = await foodsUseCase.add(food);
    either.fold((failure) => emit(AddOrUpdateOrDeleteFoodsFailureState(message: mapFailureToMessage(failure))),
        (ResponseEntity responseEntity) => emit(AddOrUpdateOrDeleteFoodStateSuccessState(message: responseEntity.message!)));
  }

  static addFoodEvent({required BuildContext context, required FoodPostModel food}) {
    BlocProvider.of<FoodOperationManagerCubit>(context).addFood(food: food);
  }

  static getFoodByIdEvent(BuildContext context, int id) => BlocProvider.of<FoodOperationManagerCubit>(context).getFoodById(id);
}
