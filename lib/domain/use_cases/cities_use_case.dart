import 'package:dartz/dartz.dart';

import '../../application/app_failures/failures.dart';
import '../entities/response_entities/city_response_entity.dart';
import '../repositories/cities_repo.dart';

class CitiesUseCase {
  final CitiesRepo citiesRepo;
  CitiesUseCase({required this.citiesRepo});
  Future<Either<Failure, CitiesResponseEntity>> getCities() => citiesRepo.getCities();
}
