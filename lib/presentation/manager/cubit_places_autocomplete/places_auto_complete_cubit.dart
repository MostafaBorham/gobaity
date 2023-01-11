// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:http/http.dart' as http;
part 'places_auto_complete_state.dart';

class PlacesAutoCompleteCubit extends Cubit<PlacesAutoCompleteState> {
  PlacesAutoCompleteCubit() : super(PlacesAutoCompleteInitial());
  placeAutoComplete(String query) async {
    Uri uri = Uri.https(
        ApiConstants.googleApisUrl, ApiConstants.placesAutoCompleteEntity, {'input': query, 'key': ApiConstants.googleApiKey});
    String? jsonString = await fetchUrl(uri: uri);
    if (jsonString != null) {
     debugPrint(jsonString);
      dynamic objectFromString = jsonString.fromStringToJson;
    }
  }

  Future<String?> fetchUrl({required Uri uri, Map<String, String>? header}) async {
    http.Response response = await http.get(uri, headers: header);
   debugPrint(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
