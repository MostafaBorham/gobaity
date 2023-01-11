import 'package:yallabaity/domain/entities/response_entities/cart_post_response_entity.dart';

class CartPostResponseModel extends CartPostResponseEntity {
  CartPostResponseModel({bool? state, String? message,double? data}) :
        super(message: message, state: state,data: data);
  factory CartPostResponseModel.fromJson(Map<String, dynamic> json) =>
      CartPostResponseModel(state: json['state'], message: json['message'],data: double.parse(json['data'].toString()) );
}
