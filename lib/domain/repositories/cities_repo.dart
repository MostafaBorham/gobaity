import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_failures/failures.dart';

import '../entities/response_entities/city_response_entity.dart';

abstract class CitiesRepo{
  Future<Either<Failure,CitiesResponseEntity>> getCities();
}