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

part 'cubit_food_manager_state.dart';

class FoodManagerCubit extends Cubit<FoodManagerState> {
  final FoodsUseCases foodsUseCase; //foods use case exists in domain layer
  FoodManagerCubit({required this.foodsUseCase}) : super(FoodCreateOrReadOrUpdateOrDeleteLoadingState());
  getFoodById(int id) async {
    emit(FoodCreateOrReadOrUpdateOrDeleteLoadingState());
    Either<Failure, FoodViewAndOrderResponseEntity> either = await foodsUseCase.get(id);
    either.fold(
        (failure) => emit(FoodErrorState(message: mapFailureToMessage(failure))),
        (FoodViewAndOrderResponseEntity responseEntity) =>
            emit(FoodLoadedState(foodViewAndOrder: responseEntity.fromEntityToModel().food!.fromEntityToModel())));
  }

  static getFoodByIdEvent(BuildContext context, int id) => BlocProvider.of<FoodManagerCubit>(context).getFoodById(id);
}
