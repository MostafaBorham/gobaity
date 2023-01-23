import '../../../domain/entities/response_entities/city_response_entity.dart';

class CitiesResponseModel extends CitiesResponseEntity {
  CitiesResponseModel({String? message, bool? state, List<CityModel>? cities}):super(state: state,message: message,cities: cities);

  CitiesResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    state = json['state'];
    if (json['data'] != null) {
      cities = <CityModel>[];
      json['data'].forEach((city) {
        cities!.add(CityModel.fromJson(city));
      });
    }
  }
  Map<String,dynamic>toJson()=>{
    'state':state,
    'message':message,
    'cities': (cities as List<CityModel>).map((city) => city.toJson()).toList()
  };
}

class CityModel extends CityEntity {
  CityModel({int? governorateId, String? governorateName})
      : super(governorateId: governorateId, governorateName: governorateName);
  CityModel.fromJson(Map<String, dynamic> json) {
    governorateId = json['governorateId'];
    governorateName = json['governorateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['governorateId'] = governorateId;
    data['governorateName'] = governorateName;
    return data;
  }
}
