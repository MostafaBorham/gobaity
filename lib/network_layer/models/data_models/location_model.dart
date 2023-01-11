import 'package:yallabaity/domain/entities/requests_entites/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    double? latitude,
    double? longitude,
  }) : super( latitude: latitude, longitude: longitude);
  LocationModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  Map<String, dynamic> toJson() => { 'latitude': latitude, 'longitude': longitude};
}
