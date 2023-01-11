part of 'cubit_ads_manager_cubit.dart';

@immutable
abstract class AdsManagerState {}

class AdsManagerInitial extends AdsManagerState {}

class AdsLoadingState extends AdsManagerState {}
class AdsErrorState extends AdsManagerState {
  final String? message;
  AdsErrorState({ this.message});
}

class AdsLoadedState extends AdsManagerState {
  final List<AdsModel> ads;
  AdsLoadedState({required this.ads});
}

