import 'dart:convert';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/application/app_constants/app_constants.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/network_layer/models/data_models/category_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/categories_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:yallabaity/network_layer/services/network_services.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesResponseModel> getCategories();
  Future<CategoriesResponseModel> getUserCategories(int id);
}

class CategoriesImplWithHttp implements CategoriesRemoteDataSource {
  final NetworkService networkService;
  const CategoriesImplWithHttp({required this.networkService});
  @override
  Future<CategoriesResponseModel> getCategories() async {
    try {
      Map<String, dynamic>? responseBody = await networkService.get(api: ApiConstants.categoriesEntity);
      CategoriesResponseModel categoriesData = CategoriesResponseModel.fromJson(responseBody!);
      return categoriesData;
    } on ServerException {
      throw ServerException();
    } on InvalidRequestException {
      throw InvalidRequestException();
    }
  }

  @override
  Future<CategoriesResponseModel> getUserCategories(int id) async {
    try {
      Map<String, dynamic>? responseBody =
          await networkService.get(api: '${ApiConstants.userCategoriesEntity}/+ ${id.toString()}');
      CategoriesResponseModel categoriesData = CategoriesResponseModel.fromJson(responseBody!);
      return categoriesData;
    } on ServerException {
      throw ServerException();
    } on InvalidRequestException {
      throw InvalidRequestException();
    }
  }
}
