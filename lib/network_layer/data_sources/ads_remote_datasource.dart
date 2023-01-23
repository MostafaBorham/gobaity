import 'package:dartz/dartz.dart';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/ads_response_entity.dart';
import 'package:yallabaity/network_layer/models/responses_model/ads_response_model.dart';
import 'package:yallabaity/network_layer/services/network_services.dart';

abstract class AdsRemoteDataSource {
  Future<AdsResponseModel> getAds();
}

class AdsImplWithHttp extends AdsRemoteDataSource {
  final NetworkService networkService;
  AdsImplWithHttp({required this.networkService});
  @override
  Future<AdsResponseModel> getAds() async {
    try {
      Map<String, dynamic> responseBody = await networkService.get(api: ApiConstants.adsEntity);
      AdsResponseModel adsResponse = AdsResponseModel.fromJson(responseBody);
      return adsResponse;
    } on ServerException {
      throw ServerException();
    } on InvalidRequestException {
      throw InvalidRequestException();
    }
  }
}
