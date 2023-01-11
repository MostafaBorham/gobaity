import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/domain/use_cases/foods_usecases.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_get_params_model.dart';

import '../../../application/app_failures/failures.dart';
import '../../../application/app_failures/map_failure_to_massage.dart';


import '../../../domain/entities/response_entities/cook_foods_response_entity.dart';
import '../../../network_layer/models/data_models/food_model.dart';
import '../cubit_cooks_managers/cubit_cooks_manager_cubit.dart';

part 'cubit_cook_foods_manager_state.dart';

class CookFoodsManagerCubit extends Cubit<CookFoodsManagerState> {
  final FoodsUseCases foodsUseCase;
  CookFoodsManagerCubit({required this.foodsUseCase}) : super(CookFoodsManagerInitial());

  getCookFoods({required CookGetParamsModel cookGetParams}) async {
    emit(CookFoodsLoadingState());
    Either<Failure, CookFoodsResponseEntity> either = await foodsUseCase.getCookFoods(cookGetParams);
    either.fold(
        (Failure failure) => emit(CookFoodsErrorState(message: mapFailureToMessage(failure))),
        (CookFoodsResponseEntity cookFoodsResponse) =>
            emit(CookFoodsLoadedState(cookFoods: cookFoodsResponse.data!.map((e) => e.toDomian()).toList())));
  }

  static getCookFoodsEvent(BuildContext context, {required CookGetParamsModel cookGetParams}) =>
      BlocProvider.of<CookFoodsManagerCubit>(context).getCookFoods(cookGetParams: cookGetParams);
}
