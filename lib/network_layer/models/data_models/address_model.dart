import 'package:yallabaity/domain/entities/requests_entites/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel(
      { super.userId,
       super.apartmentNo,
       super.buildingNo,
       super.floor,
       super.latitude,
       super.longitude,
       super.usersAddressName,
       super.address,
       super.street});


  AddressModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    apartmentNo=json['apartmentNo'];
    buildingNo=json['buildingNo'];
    floor=json['floor'];
    usersAddressName=json['usersAddressName'];
    street=json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId??1;
    data['address'] = address??'';
    data['latitude'] = latitude??0;
    data['longitude'] = longitude??0;
    data['apartmentNo'] = apartmentNo??0;
    data['buildingNo'] = buildingNo??0;
    data['floor'] = floor??0;
    data['usersAddressName'] = usersAddressName??'';
    data['street'] = street??'';

    return data;
  }
  toEntity()=>this;
  }
