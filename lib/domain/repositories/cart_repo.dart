import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';

import '../entities/requests_entites/cart_post_entity.dart';
import '../entities/response_entities/cart_post_response_entity.dart';

abstract class CartRepo{
  Future<Either<Failure,CartPostResponseEntity>> postCart({required int id,required CartPostEntity cart});
}