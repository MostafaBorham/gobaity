import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/network.dart';
import 'package:yallabaity/domain/entities/response_entities/cook_foods_response_entity.dart';
import 'package:yallabaity/domain/repositories/cooks_repo.dart';
import 'package:yallabaity/network_layer/data_sources/cooks_local_datasource.dart';
import 'package:yallabaity/network_layer/data_sources/cooks_remote_datasource.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_get_params_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/cook_foods_response_model.dart';
import 'package:yallabaity/network_layer/services/network_services.dart';

import 'package:yallabaity/network_layer/models/responses_model/cooks_response_model.dart';


class CooksRepoImpl extends CooksRepo {
  final CooksRemoteDataSource cooksRemoteDataSource;
  final CooksLocalDataSource cooksLocalDataSource;
  final NetworkStatus networkStatus;
  CooksRepoImpl({required this.cooksRemoteDataSource, required this.cooksLocalDataSource, required this.networkStatus});
  @override
  Future<Either<Failure, CooksResponseModel>> getCooks() async {
    if (await networkStatus.isConnected) {
      try {
        CooksResponseModel cooksResponse = (await cooksRemoteDataSource.getCooks()) as CooksResponseModel;
        try {
          cooksLocalDataSource.cacheCooks(cooksResponse);
          return Right(cooksResponse);
        } on WritingCashException {
          return Left(WritingCashFailure());
        }
      } on InvalidPermissionException {
        return Left(InvalidRequestFailure());
      }
    } else {
      //*get data from local data source*//*
      try {
        CooksResponseModel cooksResponse = (await cooksLocalDataSource.getCachedCooks()) as CooksResponseModel;
        return Right(cooksResponse);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
  }


}
