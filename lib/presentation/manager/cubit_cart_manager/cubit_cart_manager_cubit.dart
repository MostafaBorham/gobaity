import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/cart_post_response_entity.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/cart_post_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/cart_post_response_model.dart';

import '../../../application/app_failures/map_failure_to_massage.dart';
import '../../../domain/use_cases/cart_usescases.dart';

part 'cubit_cart_manager_state.dart';

class CartManagerCubit extends Cubit<CartManagerState> {
  CartUseCases cartUseCases;
  CartManagerCubit({required this.cartUseCases}) : super(CartManagerInitial());
  postCart({required int id, required CartPostModel cart}) async {
    emit(CartPostingState());
    Either<Failure, CartPostResponseEntity> either = await cartUseCases.postCart(id: id, cart: cart);
    either.fold((Failure failure) => emit(CartPostError(message: mapFailureToMessage(failure))),
        (CartPostResponseEntity cartPostResponse) => emit(CartPostedState(cartPostResponse: cartPostResponse.fromEntityToModel)));
  }

  static postCartEvent({required BuildContext context, required int id, required CartPostModel cart}) =>
      BlocProvider.of<CartManagerCubit>(context).postCart(id: id, cart: cart);
}
