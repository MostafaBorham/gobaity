import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';

import '../requests_entites/ads_entity.dart';

class AdsResponseEntity extends ResponseEntity {
  List<AdsEntity>? data;
  AdsResponseEntity({this.data, bool? state, String? message}) : super(state: state, message: message);
}
