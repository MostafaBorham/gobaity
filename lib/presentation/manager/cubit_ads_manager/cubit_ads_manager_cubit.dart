import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/domain/entities/response_entities/ads_response_entity.dart';
import 'package:yallabaity/domain/use_cases/ads_usecase.dart';
import 'package:yallabaity/network_layer/models/data_models/ad_model.dart';
import 'package:yallabaity/network_layer/models/responses_model/ads_response_model.dart';

import '../../../application/app_failures/map_failure_to_massage.dart';

part 'cubit_ads_manager_state.dart';

class AdsManagerCubit extends Cubit<AdsManagerState> {
  final AdsUseCase adsUseCase;
  AdsManagerCubit({required this.adsUseCase}) : super(AdsLoadingState());
  getAds() async {
    emit(AdsLoadingState());
    Either either = await adsUseCase.getAds();
    either.fold((failure) => emit(AdsErrorState(message: mapFailureToMessage(failure))),
        (adsResponse) => emit(AdsLoadedState(ads: adsResponse.data)));
  }
}
