import 'package:yallabaity/domain/entities/requests_entites/ads_entity.dart';

class AdsModel extends AdsEntity {


  AdsModel({
    int? adsId,
    String? adsImage,
    bool? isActive,
  }) : super(adsId: adsId, isActive: isActive, adsImage: adsImage);

  AdsModel.fromJson(Map<String, dynamic> json) {
    adsId = json['adsId'];
    adsImage = json['adsImage'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adsId'] = adsId;
    data['adsImage'] = adsImage;
    data['isActive'] = isActive;
    return data;
  }

}
