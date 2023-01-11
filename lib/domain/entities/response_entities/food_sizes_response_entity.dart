import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

import '../requests_entites/size_entity.dart';

class FoodSizesResponseEntity extends ResponseEntity {
  List<SizeEntity>? data;
  FoodSizesResponseEntity({
    bool? state,
    String? message,
    this.data,
  }) : super(state: state, message: message);
}

