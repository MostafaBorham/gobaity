import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/domain/entities/response_entities/food_sizes_response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/size_model.dart';

class FoodSizesResponseModel extends FoodSizesResponseEntity {
  FoodSizesResponseModel({bool? state, String? message, List<SizeModel>? data})
      : super(state: state, message: message, data: data);

  factory FoodSizesResponseModel.fromJson(Map<String, dynamic> json) {
    return FoodSizesResponseModel(
        state: json['state'],
        message: json['message'],
        data: json['data']!=null
            ? (json['data'] as List<dynamic>)
                .map((e) => SizeModel.fromJson(e))
                .toList()
            : null);
  }
  Map<String,dynamic> toJson()=>{
    'state':state,
    'message':message,
    'data':data.map((e) => e.toJson()).toList()
  };
  @override
  List<SizeModel> get data => super.data as List<SizeModel>;
}
