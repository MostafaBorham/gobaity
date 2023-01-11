import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/network.dart';
import 'package:yallabaity/domain/entities/response_entities/cart_post_response_entity.dart';
import 'package:yallabaity/domain/repositories/cart_repo.dart';
import 'package:yallabaity/network_layer/data_sources/cart_local_datasource.dart';
import 'package:yallabaity/network_layer/data_sources/cart_remote_datasource.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/responses_model/cart_post_response_model.dart';

import '../../domain/entities/requests_entites/cart_post_entity.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  final CartLocalDataSource cartLocalDataSource;
  final NetworkStatus networkStatus;
  CartRepoImpl({required this.cartRemoteDataSource, required this.cartLocalDataSource, required this.networkStatus});

  @override
  Future<Either<Failure, CartPostResponseEntity>> postCart({required int id, required CartPostEntity cart}) async {
    if (await networkStatus.isConnected) {
      try {
        CartPostResponseModel cartResponse = await cartRemoteDataSource.postCart(userId: id, cart: cart.fromEntityToModel);
        /*    try{
          adsLocalDataSource.cacheAds(adsResponse);
        }on WritingCashException{
          return Left(WritingCashFailure());

        }*/
        return Right(cartResponse);
      } on InvalidRequestException {
        return Left(InvalidRequestFailure());
      }
    } else {
      /*get data from local data source*/
      /*     try{
        AdsResponseModel adsResponse = await adsLocalDataSource.getCachedAds();
        return Right(adsResponse);

      }on EmptyCashException{
        return Left(EmptyCashFailure());

      }*/
       throw OfflineFailure();
    }
  }
}
