part of 'foods_manager_cubit.dart';

@immutable
abstract class FoodsManagerState {}
class FoodsManagerInitial extends FoodsManagerState {}
class FoodsLoadingState extends FoodsManagerState {}
class FoodsLoadedState extends FoodsManagerState {
  final List<FoodEntity> foods;
  FoodsLoadedState({required this.foods});
}
class LoadingMoreFoodsState extends FoodsManagerState {
  final List<FoodEntity> foods;
  LoadingMoreFoodsState({required this.foods});
}
class AllFoodAreLoaded extends FoodsManagerState {
  final List<FoodEntity> foods;
  AllFoodAreLoaded({required this.foods});
}
class FoodsErrorState extends FoodsManagerState {
  final String message;
  FoodsErrorState({required this.message});
}

