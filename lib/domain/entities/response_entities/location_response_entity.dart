
import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/user_response_entity.dart';

class LocationResponseEntity extends ResponseEntity {
  UserResponseEntity? data;
  LocationResponseEntity({bool? state, String? message, this.data})
      : super(state: state, message: message);

}
