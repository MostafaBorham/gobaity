
part of 'foods_bloc.dart';

@immutable
abstract class FoodsState {}

class FoodsInitial extends FoodsState {}
class LoadingFoodsState extends FoodsState {}
class LoadedFoodsState extends FoodsState {
  List<FoodEntity> foods;

  LoadedFoodsState ({
    required this.foods,
  });
}
class  LoadingFoodsErrorState extends FoodsState{
  final String message;
  LoadingFoodsErrorState({
    required this.message,
  });
}