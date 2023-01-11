import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/domain/entities/response_entities/response_entity.dart';
import 'package:yallabaity/domain/use_cases/foods_usecases.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_post_model.dart';

import '../../../application/app_failures/failures.dart';
import '../../../application/app_failures/map_failure_to_massage.dart';

part 'food_bloc_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodBlocEvent, FoodBlocState> {
  final FoodsUseCases foodUseCases;
  FoodBloc({required this.foodUseCases}) : super(FoodBlocInitial()) {
    on<FoodBlocEvent>((event, emit) async {
      // TODO: implement event handler
      Either<Failure, ResponseEntity> operation;
      if (event is AddFoodEvent) {
        emit(AddOrUpdateOrDeleteFoodStartingState());
        operation = await foodUseCases.add(event.food);
       // emit(mapEventToState(operation, addSuccessMessage));
      } else if (event is UpdateFoodEvent) {
        emit(AddOrUpdateOrDeleteFoodStartingState());
        operation = await foodUseCases.update(event.food);
      //  emit(mapEventToState(operation, updateSuccessMessage));
      } else if (event is DeleteFoodEvent) {
        emit(AddOrUpdateOrDeleteFoodStartingState());
        operation = await foodUseCases.delete(event.id);
        //emit(mapEventToState(operation, deleteSuccessMessage));
      }
    });
  }

  FoodBlocState mapEventToState(Either<Failure, ResponseEntity> either, String message) {
    FoodBlocState? state;
    either.fold((Failure failure) => state = AddOrUpdateOrDeleteFoodsFailureState(message: mapFailureToMessage(failure)),
        (ResponseEntity responseEntity) => state = AddOrUpdateOrDeleteFoodStateSuccessState(message: responseEntity.message!));
    return state!;
  }
}
