import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/cart_post_response_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/cart_post_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/cart_post_response_model.dart';
import 'package:yallabaity/network_layer/services/network_services.dart';

abstract class CartRemoteDataSource {
  const CartRemoteDataSource();
  Future<CartPostResponseModel> postCart({required int userId, required CartPostModel cart});
}

class CartImplWithHttp extends CartRemoteDataSource {
  final NetworkService networkService;
  const CartImplWithHttp({required this.networkService});
  @override
  Future<CartPostResponseModel> postCart({required int userId, required CartPostModel cart}) async {
    Map<String,dynamic>? response = await networkService.postOrUpdate(
        api: '${ApiConstants.usersEntity}/$userId/${ApiConstants.basketEntity}', body: cart.toJson);
    if (response != null) {
      CartPostResponseModel cartPostResponse = CartPostResponseModel.fromJson(response);
      return cartPostResponse;
    } else {
      throw InvalidRequestException();
    }
  }
}
