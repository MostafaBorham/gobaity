part of 'foods_bloc.dart';

@immutable
abstract class FoodsEvent {}

class LoadingFoodsEvent extends FoodsEvent {}

class LoadedFoodsEvent extends FoodsEvent {}

class RefreshFoodsEvent extends FoodsEvent {
  final FoodsGetParamsModel foodsGetParamsModel;

  RefreshFoodsEvent({required this.foodsGetParamsModel});
}

class GetAllFoodsEvent extends FoodsEvent {
  final FoodsGetParamsModel foodsGetParamsModel;

  GetAllFoodsEvent({required this.foodsGetParamsModel});
}
