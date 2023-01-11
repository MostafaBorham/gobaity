import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/ads_response_entity.dart';
import 'package:yallabaity/domain/repositories/ads_repo.dart';


class AdsUseCase {
  final AdsRepo adsRepo;
  AdsUseCase({required this.adsRepo});
  Future<Either<Failure,AdsResponseEntity>> getAds()=> adsRepo.getAds();
}