export 'types.dart';
import 'package:dartz/dartz.dart';
import 'package:yallabaity/network_layer/models/responses_model/response_model.dart';
import 'package:yallabaity/application/app_failures/failures.dart';

typedef FutureResponseModelFun = Future<ResponseModel> Function();
typedef FutureUnitOrFailureFun = Future<Either<Failure, Unit>> Function();
typedef VoidFunction = void Function()?;
typedef VoidFunctionStringParam = void Function(String text);
