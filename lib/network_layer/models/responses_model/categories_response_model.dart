import 'package:yallabaity/domain/entities/requests_entites/category_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/categories_response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/category_model.dart';

class CategoriesResponseModel extends CategoriesResponseEntity {
  CategoriesResponseModel({bool? state, String? message, List<CategoryModel>? data})
      : super(state: state, message: message, data: data);
  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => CategoriesResponseModel(
        state: json['state'],
        message: json['message'],
        data: json['data'] != null ? (json['data'] as List<dynamic>).map((e) => CategoryModel.fromJson(e)).toList() : null,
      );
  Map<String,dynamic> toJson() => {'state': state, 'message': message, 'data': data!.map((e) => e.toJson()).toList()};

  @override
  List<CategoryModel>? get data => super.data as List<CategoryModel>?;
}
