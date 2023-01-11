// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/app_failures/map_failure_to_massage.dart';
import 'package:yallabaity/domain/use_cases/sizes_usecases.dart';
import 'package:yallabaity/network_layer/models/data_models/size_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/food_sizes_response_model.dart';
part 'sizes_event.dart';
part 'sizes_state.dart';

class SizesBloc extends Bloc<SizesEvent, SizesState> {
  SizesUseCase sizesUseCases;

  SizesBloc({required this.sizesUseCases})
      : super(SizesInitial()) {
    on<SizesEvent>((event, emit) async {
     debugPrint(event.runtimeType.toString());
      if (event is GetSizesEvent) {
        emit(LoadingSizesState());
        final Either<Failure, FoodSizesResponseModel>
        sizes =
        await sizesUseCases.getAll();
        sizes.fold(
                (Failure failure) =>
                emit(ErrorState(message: mapFailureToMessage(failure))),
                (FoodSizesResponseModel foodSizesResponse) => emit(
                LoadedSizesState(sizes: foodSizesResponse.data)));
      }
    });
  }
}
