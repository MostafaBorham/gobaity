import 'package:flutter/cupertino.dart';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/domain/entities/response_entities/food_sizes_response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/size_model.dart';
import 'package:http/http.dart' as http;
import 'package:yallabaity/network_layer/models/responses_model/food_sizes_response_model.dart';

abstract class SizesRemoteDataSource {
  Future<FoodSizesResponseModel> getSizes();
}

class SizesImplWithHttp implements SizesRemoteDataSource {
  final http.Client client;
  const SizesImplWithHttp({required this.client});
  @override
  Future<FoodSizesResponseModel> getSizes() async {
    Uri uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sizesEntity ,
    );
   debugPrint(uri.toString());
    http.Response response = await client.get(uri,
        headers: {'Content-Type': 'application/json', 'Accept-Language': 'en'});
   debugPrint(response.statusCode.toString());
   debugPrint(response.body);
    if (response.statusCode == 200) {
      FoodSizesResponseModel sizesData =
          FoodSizesResponseModel.fromJson(response.body.fromStringToJson);
      if (sizesData.state!) {
        return sizesData;
      } else {
        throw InvalidRequestException();
      }
    } else {
      throw ServerException();
    }
  }
}

/*class SizesImplWithDio implements SizesRemoteDataSource {
  @override
  Future<SizesData> getSizes() {
    // TODO: implement getAllSizesAndSizes
    throw UnimplementedError();
  }
}*/
