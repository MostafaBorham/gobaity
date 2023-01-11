import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';

import 'package:yallabaity/domain/entities/response_entities/categories_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/user_response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/location_model.dart';
import 'package:yallabaity/network_layer/models/data_models/user_model.dart';

import '../entities/requests_entites/user_entity.dart';


abstract class UserRepo {
 // Either<Failure,Unit> login(String phoneName)
  Future<Either<Failure,UserResponseEntity>> register(UserEntity user);
  Future<Either<Failure,UserResponseEntity>> login({required String phone,required String password});
  Future<Either<Unit,UserEntity>> getUser();
 Future< Either<Failure,CategoriesResponseEntity>> getUserCategories();
  Future<Either<Failure,UserResponseEntity>> updateLocation(LocationModel location);
}