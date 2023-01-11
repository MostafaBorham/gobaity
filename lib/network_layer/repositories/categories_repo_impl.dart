import 'package:dartz/dartz.dart';

import 'package:yallabaity/domain/repositories/categories_repo.dart';
import 'package:yallabaity/network_layer/data_sources/categories_local_datasource.dart';

import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/network_layer/data_sources/categories_remote_data_source.dart';
import 'package:yallabaity/application/network.dart';
import 'package:yallabaity/network_layer/models/responses_model/categories_response_model.dart';

import '../../domain/entities/response_entities/categories_response_entity.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  final CategoriesLocalDataSource categoriesLocalDataSource;
  final NetworkStatus networkStatus;
  CategoriesRepoImpl({
    required this.categoriesRemoteDataSource,
    required this.categoriesLocalDataSource,
    required this.networkStatus,
  });
  @override
  Future<Either<Failure, CategoriesResponseModel>> getCategories() async {
    /* in case internet connected
    *  we will use internet_connection_checker: package to check internet connectivity
    *  */
    if (await networkStatus.isConnected) {
      try {
        /* remote data source */
        final CategoriesResponseModel categoriesResponse = await categoriesRemoteDataSource.getCategories();
        categoriesLocalDataSource.cacheCategories(categoriesResponse);
        return Right(categoriesResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /* in case internet not connected */
      /*local data source*/
      try {
        final localCategories = await categoriesLocalDataSource.getCachedCategories();
        return Right(localCategories);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CategoriesResponseEntity>> getUserCategories(int id) async {
    // TODO: implement getCategoriesOfUser
    if (await networkStatus.isConnected) {
      try {
        /* remote data source */
        final CategoriesResponseModel categoriesResponse = await categoriesRemoteDataSource.getUserCategories(id);
        categoriesLocalDataSource.cacheUserCategories(id, categoriesResponse);
        return Right(categoriesResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /* in case internet not connected */
      /*local data source*/
      try {
        final localCategories = await categoriesLocalDataSource.getCachedUserCategories(id);
        return Right(localCategories);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
  }
}
