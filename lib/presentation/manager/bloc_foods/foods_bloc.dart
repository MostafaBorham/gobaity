import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/app_failures/map_failure_to_massage.dart';
import 'package:yallabaity/domain/entities/response_entities/foods_respnse_entity.dart';
import 'package:yallabaity/domain/use_cases/foods_usecases.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/foods_response_model.dart';

import '../../../domain/entities/requests_entites/food_entity.dart';


part 'foods_event.dart';
part 'foods_state.dart';

class FoodsBloc extends Bloc<FoodsEvent, FoodsState> {
  final FoodsUseCases foodUseCases;

  FoodsBloc({required this.foodUseCases}) : super(FoodsInitial()) {
    on<FoodsEvent>((event, emit) async{
      if (event is GetAllFoodsEvent) {
        emit(LoadingFoodsState());
        Either<Failure, FoodsResponseEntity> either = await foodUseCases.getAll(foodsGetParams: event.foodsGetParamsModel);
        emit(mapEventToState(either));
      }
      if (event is RefreshFoodsEvent) {
        emit(LoadingFoodsState());
        Either<Failure, FoodsResponseEntity> either = await foodUseCases.getAll(foodsGetParams: event.foodsGetParamsModel);
        emit(mapEventToState(either));
      }
    });
  }
  FoodsState mapEventToState(
      Either<Failure, FoodsResponseEntity> either,
      ) {
    FoodsState? state;
    either.fold(
            (Failure failure) =>
        state = LoadingFoodsErrorState(message: mapFailureToMessage(failure)),
            (FoodsResponseEntity foodsResponse) => state = LoadedFoodsState(foods: foodsResponse.data!));
    return state!;
  }
}
