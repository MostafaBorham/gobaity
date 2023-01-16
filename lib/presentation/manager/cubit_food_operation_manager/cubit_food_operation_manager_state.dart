part of 'cubit_food_operation_manager_cubit.dart';

abstract class FoodOperationManagerState {}

class FoodManagerInitial extends FoodOperationManagerState {}

class FoodCreateOrReadOrUpdateOrDeleteLoadingState extends FoodOperationManagerState {}

class FoodLoadedState extends FoodOperationManagerState{
  final FoodViewAndOrderModel? foodViewAndOrder;
  FoodLoadedState({this.foodViewAndOrder});
}

class FoodErrorState extends FoodOperationManagerState{
  final String? message;
  FoodErrorState({this.message});
}
class AddOrUpdateOrDeleteFoodStartingState extends FoodOperationManagerState{}

class AddOrUpdateOrDeleteFoodStateSuccessState extends FoodOperationManagerState {
  final String message;
  AddOrUpdateOrDeleteFoodStateSuccessState({
    required this.message,
  });
}

class AddOrUpdateOrDeleteFoodsFailureState extends FoodOperationManagerState {
  final String message;
  AddOrUpdateOrDeleteFoodsFailureState({
    required this.message,
  });
}
class DeleteFoodEvent extends FoodOperationManagerState{
  final int id;

  DeleteFoodEvent({
    required this.id,
  });
}

class UpdateFoodEvent extends FoodOperationManagerState{
  final FoodModel food;

  UpdateFoodEvent({
    required this.food,
  });
}

