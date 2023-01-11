part of 'cubit_cooks_manager_cubit.dart';

@immutable
abstract class CooksManagerState {}

class CooksManagerInitial extends CooksManagerState {}
class CooksLoadingState extends CooksManagerState {}
class CooksErrorState extends CooksManagerState {
  final String? message;
  CooksErrorState({ this.message});
}

class CooksLoadedState extends CooksManagerState  {
  final List<CookModel> cooks;
  CooksLoadedState({required this.cooks});
}
