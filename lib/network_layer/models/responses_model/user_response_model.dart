import 'package:yallabaity/domain/entities/response_entities/user_response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/user_model.dart';

class UserResponseModel extends UserResponseEntity {
  UserResponseModel({bool? state, String? message, UserModel? data})
      : super(state: state, message: message, data: data);
  UserResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    state = json['state'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['state'] = state;
    data['data'] = this.data.toJson();
    return data;
  }
  @override
  UserModel get data=>super.data as UserModel;


}
