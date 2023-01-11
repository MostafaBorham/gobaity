import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/domain/entities/response_entities/ads_response_entity.dart';
import 'package:yallabaity/network_layer/models/responses_model/ads_response_model.dart';


abstract class AdsLocalDataSource {
  Future<AdsResponseModel> getCachedAds();
  Future<Unit> cacheAds(AdsResponseModel adsResponse);
}

class AdsImplWithPrefs extends AdsLocalDataSource {
  final SharedPreferences preferences;
  final String adsKey = 'CACHED_ADS';
  AdsImplWithPrefs({
    required this.preferences,
  });
  @override
  Future<AdsResponseModel> getCachedAds() async {
    String? savedAdsString = preferences.getString(adsKey);
    if (savedAdsString != null) {
      AdsResponseModel adsResponse = AdsResponseModel.fromJson(savedAdsString.fromStringToJson);
      return adsResponse;
    } else {
      throw EmptyCashException();
    }
  }

  @override
  Future<Unit> cacheAds(AdsResponseModel adsResponse) async {
    bool isSaved = await preferences.setString(adsKey, adsResponse.toJson().fromJsonToString);
    if(isSaved) return unit;
    throw WritingCashException();
  }
}
