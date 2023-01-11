import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

import '../requests_entites/category_entity.dart';

class CategoriesResponseEntity extends ResponseEntity {
  List<CategoryEntity>? data;
  CategoriesResponseEntity({
    bool? state,
    String? message,
    this.data,
  }) : super(state: state, message: message);
}

