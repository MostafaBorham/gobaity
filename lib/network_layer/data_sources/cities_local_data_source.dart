import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/network_layer/models/responses_model/cities_response_model.dart';

import '../../application/app_failures/exception.dart';
import '../../application/app_prefs.dart';

abstract class CitiesLocalDataSource{
   Future<Unit>  cacheCities(CitiesResponseModel citiesResponse);
}
class CitiesImplWithPrefs extends CitiesLocalDataSource{
  final SharedPreferences preferences;
  CitiesImplWithPrefs({required this.preferences});
  @override
  Future<Unit> cacheCities(CitiesResponseModel citiesResponse)async {
    bool isSaved=await preferences.setString(AppPrefs.citiesKey, citiesResponse.toJson().fromJsonToString);
    if(isSaved) return unit;
    throw WritingCashException();
  }

}