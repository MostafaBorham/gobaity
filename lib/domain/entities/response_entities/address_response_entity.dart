import 'package:yallabaity/domain/entities/requests_entites/address_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

import '../requests_entites/user_entity.dart';

class AddressResponseEntity extends ResponseEntity {
  AddressEntity? data;
  AddressResponseEntity({bool? state, String? message, this.data})
      : super(state: state, message: message);

}
