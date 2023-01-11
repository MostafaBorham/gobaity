import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/cooks_response_entity.dart';

abstract class CooksRepo {
  Future<Either<Failure, CooksResponseEntity>> getCooks();

}
