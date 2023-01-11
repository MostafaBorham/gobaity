import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/ads_response_entity.dart';

abstract class AdsRepo {
  Future<Either<Failure, AdsResponseEntity>> getAds();
}
