part of 'foods_bloc.dart';

@immutable
abstract class FoodsEvent {}

class LoadingFoodsEvent extends FoodsEvent {}

class LoadedFoodsEvent extends FoodsEvent {}

class RefreshFoodsEvent extends FoodsEvent {}

class GetAllFoodsEvent extends FoodsEvent {}
