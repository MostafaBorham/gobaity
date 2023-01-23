import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

class CitiesResponseEntity extends ResponseEntity {
  List<CityEntity>? cities;
  CitiesResponseEntity({bool? state, String? message, this.cities})
      : super(
          message: message,
          state: state,
        );
}

class CityEntity {
  int? governorateId;
  String? governorateName;
  CityEntity({this.governorateId, this.governorateName});
}
