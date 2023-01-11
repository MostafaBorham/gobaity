import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/app_failures/map_failure_to_massage.dart';
import 'package:yallabaity/domain/entities/response_entities/cook_foods_response_entity.dart';
import 'package:yallabaity/domain/use_cases/cooks_usecase.dart';
import 'package:yallabaity/network_layer/mapper/mapper.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_get_params_model.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/cook_foods_response_model.dart';

part 'cubit_cooks_manager_state.dart';

class CooksManagerCubit extends Cubit<CooksManagerState> {
  final CooksUseCase cooksUseCase;

  CooksManagerCubit({required this.cooksUseCase}) : super(CooksLoadingState());
  getCooks() async {
    Either either = await cooksUseCase.getCooks();
    either.fold((failure) => emit(CooksErrorState(message: mapFailureToMessage(failure))),
        (cooksResponse) => emit(CooksLoadedState(cooks: cooksResponse.data)));
  }

}
