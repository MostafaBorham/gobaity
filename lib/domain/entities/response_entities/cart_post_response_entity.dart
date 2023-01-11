import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

class CartPostResponseEntity extends ResponseEntity{
  double? data;
  CartPostResponseEntity({this.data,bool? state,String? message}):super(message: message,state: state);
}