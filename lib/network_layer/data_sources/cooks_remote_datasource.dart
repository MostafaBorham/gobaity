import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_get_params_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/cook_foods_response_model.dart';
import 'package:yallabaity/network_layer/services/network_services.dart';

import '../models/responses_model/cooks_response_model.dart';

abstract class CooksRemoteDataSource {
  Future<CooksResponseModel> getCooks();
}

class CooksImplWithHttp extends CooksRemoteDataSource {
  final NetworkService networkService;
  CooksImplWithHttp({required this.networkService});
  @override
  Future<CooksResponseModel> getCooks() async {
    try {
      Map<String, dynamic> responseBody = await networkService.get(api: ApiConstants.usersEntity);
      CooksResponseModel cooksResponse = CooksResponseModel.fromJson(responseBody);
      return cooksResponse;
    } on ServerException {
      throw ServerException();
    } on InvalidRequestException {
      throw InvalidRequestException();
    }
  }
}
