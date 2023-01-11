import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/network.dart';
import 'package:yallabaity/domain/entities/response_entities/ads_response_entity.dart';
import 'package:yallabaity/domain/repositories/ads_repo.dart';
import 'package:yallabaity/network_layer/models/responses_model/ads_response_model.dart';

import '../data_sources/ads_local_datasource.dart';
import '../data_sources/ads_remote_datasource.dart';

class AdsRepoImpl extends AdsRepo {
  final AdsRemoteDataSource adsRemoteDataSource;
  final AdsLocalDataSource adsLocalDataSource;
  final NetworkStatus networkStatus;
  AdsRepoImpl({
    required this.networkStatus,
    required this.adsRemoteDataSource,
    required this.adsLocalDataSource,
  });
  @override
  Future<Either<Failure, AdsResponseEntity>> getAds() async {
    if (await networkStatus.isConnected) { // mobile has internet access
      try { // get data from remote data source
        AdsResponseModel adsResponse = await adsRemoteDataSource.getAds();
        try{
          adsLocalDataSource.cacheAds(adsResponse);
        }on WritingCashException{
          return Left(WritingCashFailure());

        }
        return Right(adsResponse);
      } on InvalidPermissionException {
        return Left(InvalidRequestFailure());
      }
    } else {
      /*get data from local data source*/
      try{ /* get data from cache */
        AdsResponseModel adsResponse = await adsLocalDataSource.getCachedAds();
        return Right(adsResponse);

      }on EmptyCashException{
        return Left(EmptyCashFailure());

      }

    }
    throw UnimplementedError();
  }
}
