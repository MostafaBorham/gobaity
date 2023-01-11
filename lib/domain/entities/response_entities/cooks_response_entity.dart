import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

import '../requests_entites/cook_entity.dart';

class CooksResponseEntity extends ResponseEntity{

  List<CookEntity>? data;

  CooksResponseEntity({this.data,String? message, bool? state}):super(state: state,message: message);


}

