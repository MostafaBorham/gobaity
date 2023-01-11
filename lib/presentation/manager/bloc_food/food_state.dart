part of 'food_bloc.dart';

@immutable
abstract class FoodBlocState {}

class FoodBlocInitial extends FoodBlocState {}

class AddOrUpdateOrDeleteFoodStartingState extends FoodBlocState {}

class AddOrUpdateOrDeleteFoodStateSuccessState extends FoodBlocState {
  final String message;
  AddOrUpdateOrDeleteFoodStateSuccessState({
    required this.message,
  });
}

class AddOrUpdateOrDeleteFoodsFailureState extends FoodBlocState {
  final String message;
  AddOrUpdateOrDeleteFoodsFailureState({
    required this.message,
  });
}
