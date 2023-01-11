import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallabaity/application/extensions.dart';

import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/network_layer/models/data_models/category_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/categories_response_model.dart';

abstract class CategoriesLocalDataSource {
  Future<CategoriesResponseModel> getCachedCategories();
  Future<Unit> cacheCategories(CategoriesResponseModel categoriesResponse);
  Future<Unit> cacheUserCategories(int id, CategoriesResponseModel categoriesResponse);
  Future<CategoriesResponseModel> getCachedUserCategories(int id);
}

class CategoriesImplWithPrefs implements CategoriesLocalDataSource {
  final SharedPreferences preferences;
  final String categoriesKey = 'CACHED_CATEGORIES';
  CategoriesImplWithPrefs({required this.preferences});

  @override
  Future<CategoriesResponseModel> getCachedCategories() async {
    //  preferences.remove(categoriesKey);
    String? cashedCategories = preferences.getString(categoriesKey);
    if (cashedCategories != null) {
      return CategoriesResponseModel.fromJson(cashedCategories.fromStringToJson);
    } else {
      throw EmptyCashException();
    }
  }

  @override
  Future<Unit> cacheCategories(CategoriesResponseModel categoriesResponse) async {
    String categoriesString = categoriesResponse.toJson().fromJsonToString;
    await preferences.setString(categoriesKey, categoriesString);
    return unit;
  }

  @override
  Future<Unit> cacheUserCategories(int id, CategoriesResponseModel categoriesResponse) async {
    String categoriesString = categoriesResponse.toJson().fromJsonToString;
    await preferences.setString(categoriesKey + id.toString(), categoriesString);
    return unit;
  }

  @override
  Future<CategoriesResponseModel> getCachedUserCategories(int id) async {
    String? cashedCategories = preferences.getString(categoriesKey + id.toString());
    if (cashedCategories != null) {
      return CategoriesResponseModel.fromJson(cashedCategories.fromStringToJson);
    } else {
      throw EmptyCashException();
    }
  }
}
