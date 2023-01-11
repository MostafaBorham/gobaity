part of 'cubit_cart_manager_cubit.dart';

@immutable
abstract class CartManagerState {}

class CartManagerInitial extends CartManagerState {}
class CartPostingState extends CartManagerState{}
class CartPostedState extends CartManagerState{
 final  CartPostResponseModel cartPostResponse;
  CartPostedState({required this.cartPostResponse});
}
class CartPostError extends CartManagerInitial{
  final String message;
  CartPostError({required this.message});
}