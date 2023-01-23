import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/network_layer/services/network_services.dart';

import '../models/responses_model/cities_response_model.dart';
abstract class CitiesRemoteDataSource{
  Future<CitiesResponseModel> getCities();
}
class CitiesRemoteDataSourceImplWithHttp extends CitiesRemoteDataSource{
 final NetworkService networkService;
 CitiesRemoteDataSourceImplWithHttp({required this.networkService});

  @override
  Future<CitiesResponseModel> getCities() async{
    Map<String,dynamic>? data=await networkService.get(api: ApiConstants.citiesEntity);
    try{
      CitiesResponseModel citiesResponse= CitiesResponseModel.fromJson(data!);
      return citiesResponse;
    }on ServerException{
      throw ServerException();
    }on InvalidRequestException {
      throw InvalidRequestException();
    }

  }
}