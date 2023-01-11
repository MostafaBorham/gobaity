import 'package:yallabaity/domain/entities/requests_entites/cook_get_params.dart';

class CookGetParamsModel extends CookGetParamsEntity{
  CookGetParamsModel({int? providerId,int? categoryId=-1,String? order}):super(providerId: providerId,categoryId: categoryId,order: order);
  toJson()=>{
    'providerId':providerId.toString(),
    'order':order,
    'categoryId':categoryId.toString()
  };
}