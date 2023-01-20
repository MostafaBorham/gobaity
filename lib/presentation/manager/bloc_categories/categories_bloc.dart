import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/domain/entities/requests_entites/category_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/categories_response_entity.dart';
import 'package:yallabaity/domain/use_cases/categories_usecases.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/app_failures/map_failure_to_massage.dart';
import 'package:yallabaity/network_layer/models/responses_model/categories_response_model.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc
    extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesUseCase categoriesUseCases;

  CategoriesBloc({required this.categoriesUseCases})
      : super(SizesCategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      if (event is GetCategoriesEvent) {
        emit(LoadingState());
        final Either<Failure, CategoriesResponseEntity> categoriesResponse = await categoriesUseCases.getAll();
        categoriesResponse.fold(
            (Failure failure) =>
                emit(ErrorState(message: mapFailureToMessage(failure))),
            (CategoriesResponseEntity categoriesResponse) => emit(
                LoadedState(categories: categoriesResponse.data!)));
      }
      if(event is GetUserCategoriesEvent){
        emit(LoadingState());
        final Either<Failure, CategoriesResponseEntity> userCategoriesResponse = await categoriesUseCases.getUserCategories(event.userId);
        userCategoriesResponse.fold(
                (Failure failure) =>
                emit(ErrorState(message: mapFailureToMessage(failure))),
                (CategoriesResponseEntity userCategoriesResponse) => emit(
                LoadedState(categories: userCategoriesResponse.data!)));
      }
    });
  }

}
