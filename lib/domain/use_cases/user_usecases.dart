import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/requests_entites/location_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/user_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/address_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/categories_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/user_response_entity.dart';
import 'package:yallabaity/domain/repositories/user_repo.dart';
import 'package:yallabaity/network_layer/models/data_models/address_model.dart';
import 'package:yallabaity/network_layer/models/data_models/location_model.dart';
import 'package:yallabaity/network_layer/models/data_models/user_model.dart';

class UserUseCase {
  final UserRepo userRepo;

  const UserUseCase({
    required this.userRepo,
  });
  Future<Either<Failure, UserResponseEntity>> register(UserModel user) async => userRepo.register(user);
  Future<Either<Failure, AddressResponseEntity>> saveUserAddress(AddressModel address) async => userRepo.saveUserAddress(address);
  Future<Either<Failure, UserResponseEntity>> login({required String phone, required String password}) async =>
      userRepo.login(phone: phone, password: password);
  Future<Either<Unit, UserEntity>> getUser() async => userRepo.getUser();

  Future<Either<Failure, UserResponseEntity>> updateLocation(LocationModel location) async => userRepo.updateLocation(location);
  /* Future<Either<Failure, CategoriesResponseEntity>> getUserCategories(int) async =>
      userRepo.getUserCategories();*/

}
