import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/requests_entites/cook_get_params.dart';
import 'package:yallabaity/domain/entities/response_entities/ads_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/cooks_response_entity.dart';
import 'package:yallabaity/domain/repositories/ads_repo.dart';
import 'package:yallabaity/domain/repositories/cooks_repo.dart';

class CooksUseCase {
  final CooksRepo cooksRepo;
  CooksUseCase({required this.cooksRepo});
  Future<Either<Failure, CooksResponseEntity>> getCooks() => cooksRepo.getCooks();

}
