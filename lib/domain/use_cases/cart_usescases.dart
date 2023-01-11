import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/requests_entites/cart_post_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/cart_post_response_entity.dart';
import 'package:yallabaity/domain/repositories/cart_repo.dart';

class CartUseCases {
  final CartRepo cartRepo;
  CartUseCases({required this.cartRepo});
  Future<Either<Failure, CartPostResponseEntity>> postCart({required int id, required CartPostEntity cart}) =>
      cartRepo.postCart(id: id, cart: cart);
}
