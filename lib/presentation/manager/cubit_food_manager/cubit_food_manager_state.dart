part of 'cubit_food_manager_cubit.dart';

abstract class FoodManagerState {}

class FoodManagerInitial extends FoodManagerState {}

class FoodCreateOrReadOrUpdateOrDeleteLoadingState extends FoodManagerState {}

class FoodLoadedState extends FoodManagerState{
  final FoodViewAndOrderModel? foodViewAndOrder;
  FoodLoadedState({this.foodViewAndOrder});
}

class FoodErrorState extends FoodManagerState{
  final String? message;
  FoodErrorState({this.message});
}
