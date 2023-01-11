part of 'food_bloc.dart';

@immutable
abstract class FoodBlocEvent {}

class AddFoodEvent extends FoodBlocEvent {
  final FoodPostModel food;

  AddFoodEvent({
    required this.food,
  });
}

class DeleteFoodEvent extends FoodBlocEvent {
  final int id;

  DeleteFoodEvent({
    required this.id,
  });
}

class UpdateFoodEvent extends FoodBlocEvent {
  final FoodModel food;

  UpdateFoodEvent({
    required this.food,
  });
}
