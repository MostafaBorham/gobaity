import 'package:yallabaity/domain/entities/response_entities/address_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/user_response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/address_model.dart';
import 'package:yallabaity/network_layer/models/data_models/user_model.dart';

class AddressResponseModel extends AddressResponseEntity {
  AddressResponseModel({bool? state, String? message, AddressModel? data})
      : super(state: state, message: message, data: data);
  AddressResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    state = json['state'];
    data = json['data'] != null ? AddressModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['state'] = state;
    data['data'] = this.data.toJson();
    return data;
  }
  @override
  AddressModel get data=>super.data as AddressModel;


}
