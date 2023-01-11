import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/categories_response_entity.dart';

abstract class  CategoriesRepo{
  Future<Either<Failure,CategoriesResponseEntity>> getCategories();
  Future<Either<Failure,CategoriesResponseEntity>> getUserCategories(int id);

}