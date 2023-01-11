import '../../../network_layer/models/data_models/location_model.dart';

class LocationEntity {
  double? latitude;
  double? longitude;
  LocationEntity({this.latitude, this.longitude});
  toModel() => this as LocationModel;
}
