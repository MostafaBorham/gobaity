import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/extensions.dart';

import '../models/responses_model/cooks_response_model.dart';


abstract class CooksLocalDataSource {
  Future<CooksResponseModel> getCachedCooks();
  Future<Unit> cacheCooks(CooksResponseModel cooksResponse);

}

class CooksImplWithPrefs extends CooksLocalDataSource {
  final SharedPreferences preferences;
  final String cooksKey = 'CACHED_COOKS';
  CooksImplWithPrefs({
    required this.preferences,
  });
  @override
  Future<CooksResponseModel> getCachedCooks() async {
    String? savedCooksString = preferences.getString(cooksKey);
    if (savedCooksString != null) {
      CooksResponseModel cooksResponse = CooksResponseModel.fromJson(savedCooksString.fromStringToJson);
      return cooksResponse;
    } else {
      throw EmptyCashException();
    }
  }

  @override
  Future<Unit> cacheCooks(CooksResponseModel cooksResponse) async {
    bool isSaved = await preferences.setString(cooksKey, cooksResponse.toJson().fromJsonToString);
    if (isSaved) return unit;
    throw WritingCashException();
  }


}
