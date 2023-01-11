import 'package:dartz/dartz.dart';
import 'package:yallabaity/domain/repositories/sizes_repo.dart';
import 'package:yallabaity/network_layer/data_sources/food_sizes_local_datasource.dart';
import 'package:yallabaity/network_layer/data_sources/food_sizes_remote_datasource.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/network.dart';
import 'package:yallabaity/network_layer/models/responses_model/food_sizes_response_model.dart';

class SizesRepoImpl extends SizesRepo {
  final SizesRemoteDataSource sizesRemoteDataSource;
  final SizesLocalDataSource sizesLocalDataSource;
  final NetworkStatus networkStatus;
  SizesRepoImpl({
    required this.sizesRemoteDataSource,
    required this.sizesLocalDataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, FoodSizesResponseModel>> getAll()async {
    /* in case internet connected
    *  we will use internet_connection_checker: package to check internet connectivity
    *  */
    if (await networkStatus.isConnected) {
      try {
        /* remote data source */
        final FoodSizesResponseModel foodSizesResponse =
            await sizesRemoteDataSource.getSizes();
        sizesLocalDataSource.cacheSizes(foodSizesResponse);
        return Right(foodSizesResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /* in case internet not connected */
      /*local data source*/
      try {
        final localSizes =
            await sizesLocalDataSource.getCachedSizes();
        return Right(localSizes);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
  }

}
