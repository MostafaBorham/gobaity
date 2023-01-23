import 'package:yallabaity/network_layer/models/data_models/address_model.dart';

class AddressEntity{
  int? userId;
  int? apartmentNo;
  int? buildingNo;
  int? floor;
  int? latitude;
  int? longitude;
  String? usersAddressName;
  String? address;
  String? street;

  AddressEntity({
    this.userId,
    this.apartmentNo,
    this.buildingNo,
    this.floor,
    this.latitude,
    this.longitude,
    this.usersAddressName,
    this.address,
    this.street
  });

  toModel()=>this as AddressModel;
}