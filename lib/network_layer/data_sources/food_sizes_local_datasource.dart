import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/network_layer/models/responses_model/food_sizes_response_model.dart';

abstract class SizesLocalDataSource {
  Future<FoodSizesResponseModel > getCachedSizes();
  Future<Unit> cacheSizes(FoodSizesResponseModel foodSizesResponse);
}
class SizesImplWithPrefs implements SizesLocalDataSource {
  final SharedPreferences preferences;
  final String sizesKey = 'CACHED_SIZES';
  SizesImplWithPrefs({required this.preferences});

  @override
  Future<FoodSizesResponseModel> getCachedSizes() async {
    String? cashedSizes = preferences.getString(sizesKey);
    if (cashedSizes != null) {
      return FoodSizesResponseModel.fromJson(cashedSizes.fromStringToJson);
    } else {
      throw EmptyCashException();
    }
  }

  @override
  Future<Unit> cacheSizes(FoodSizesResponseModel foodSizesResponse) async {
    String SizesString =
        foodSizesResponse.toJson().fromJsonToString;
    await preferences.setString(sizesKey, SizesString);
    return unit;
  }
}
