import 'package:dartz/dartz.dart';
import 'package:yallabaity/domain/entities/response_entities/categories_response_entity.dart';
import 'package:yallabaity/domain/repositories/categories_repo.dart';
import 'package:yallabaity/application/app_failures/failures.dart';

class CategoriesUseCase {
  final CategoriesRepo categoriesRepo;
  CategoriesUseCase({required this.categoriesRepo});
  Future<Either<Failure, CategoriesResponseEntity>> getAll() async {
    return categoriesRepo.getCategories();
  } 
  Future<Either<Failure, CategoriesResponseEntity>> getUserCategories(int id) async {
    return categoriesRepo.getUserCategories(id);
  }
}
