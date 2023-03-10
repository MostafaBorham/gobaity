part of 'cubit_cook_foods_manager_cubit.dart';

@immutable
abstract class CookFoodsManagerState {}

class CookFoodsManagerInitial extends CookFoodsManagerState {}
class CookFoodsLoadingState extends CookFoodsManagerState {}


class CookFoodsLoadedState extends CookFoodsManagerState {
  final List<FoodModel> cookFoods;
  CookFoodsLoadedState({required this.cookFoods});
}
class CookFoodsErrorState extends CookFoodsManagerState {
  final String message;
  CookFoodsErrorState({required this.message});
}
