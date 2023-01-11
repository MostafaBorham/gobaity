import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

import '../requests_entites/user_entity.dart';

class UserResponseEntity extends ResponseEntity {
  UserEntity? data;
  UserResponseEntity({bool? state, String? message, this.data})
      : super(state: state, message: message);

}
