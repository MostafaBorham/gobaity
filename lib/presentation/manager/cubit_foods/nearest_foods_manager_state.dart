part of 'nearest_foods_manager_cubit.dart';


@immutable
abstract class NearestFoodsManagerState {}
class NearestFoodsManagerInitial extends NearestFoodsManagerState {}
class NearestFoodsLoadingState extends NearestFoodsManagerState {}
class NearestFoodsLoadedState extends NearestFoodsManagerState {
  final List<FoodEntity> foods;
  NearestFoodsLoadedState({required this.foods});
}
class NearestLoadingMoreFoodsState extends NearestFoodsManagerState {
  final List<FoodEntity> foods;
  NearestLoadingMoreFoodsState({required this.foods});
}
class NearestAllFoodAreLoaded extends NearestFoodsManagerState {
  final List<FoodEntity> foods;
  NearestAllFoodAreLoaded({required this.foods});
}
class NearestFoodsErrorState extends NearestFoodsManagerState {
  final String message;
  NearestFoodsErrorState({required this.message});
}

