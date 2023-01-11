import 'package:dartz/dartz.dart';
import 'package:yallabaity/domain/entities/response_entities/food_sizes_response_entity.dart';
import 'package:yallabaity/domain/repositories/sizes_repo.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/network_layer/models/responses_model/food_sizes_response_model.dart';

class SizesUseCase {
  final SizesRepo sizesRepo;
  SizesUseCase({required this.sizesRepo});
  Future<Either<Failure, FoodSizesResponseModel>> getAll() async {
    return sizesRepo.getAll();
  }
}
