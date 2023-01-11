import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

class ResponseModel extends ResponseEntity{
  dynamic data;
  ResponseModel({bool? state,String? message,this.data}):super(state: state,message: message);
  factory ResponseModel.fromJson(Map<String,dynamic>json)=>ResponseModel(state:json['state'],message: json['message'],data: json['message'] );
}