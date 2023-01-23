import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/application/enums/app_messages.dart';
import 'package:yallabaity/application/app_prefs.dart';
import 'package:yallabaity/application/app_failures/failures.dart';
import 'package:yallabaity/application/app_failures/map_failure_to_massage.dart';
import 'package:yallabaity/domain/entities/requests_entites/user_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/address_response_entity.dart';
import 'package:yallabaity/domain/entities/response_entities/user_response_entity.dart';
import 'package:yallabaity/domain/use_cases/user_usecases.dart';
import 'package:yallabaity/network_layer/models/data_models/address_model.dart';
import 'package:yallabaity/network_layer/models/data_models/location_model.dart';
import 'package:yallabaity/network_layer/models/data_models/user_model.dart';
import 'package:yallabaity/network_layer/repositories/user_repo_impl.dart';

part 'cubit_user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserUseCase userUseCase;
  final AppPrefs appPrefs;
  UserModel? user;
  UserCubit({required this.userUseCase, required this.appPrefs})
      : super(UserInitial());
  registerUser(UserModel user) async {
    emit(UserRegisteringState());
    UserState state =
        mapEventToState(await userUseCase.register(user.toEntity()));
    emit(state);
  }

  saveUserAddress(AddressModel address) async {
    emit(UserSavingAddressState());
    Either<Failure, AddressResponseEntity> either=await userUseCase.saveUserAddress(address.toEntity());
    UserState? state;
    either.fold(
            (Failure failure) =>
            state=UserFailedSaveAddressState(message: mapFailureToMessage(failure)),
            (AddressResponseEntity addressResponseEntity) =>
            state= UserSavedAddressState(addressResponseEntity: addressResponseEntity));
  emit(state!);
  }
  loginUser({required String phone, required String password}) async {
    emit(UserLoginState());
    Either<Failure, UserResponseEntity> either =
        await userUseCase.login(phone: phone, password: password);
    either.fold(
        (Failure failure) => mapFailureToMessage(failure),
        (UserResponseEntity userResponseEntity) =>
            emit(UserLoggedInState(userResponseEntity)));
    // UserState state = mapEventToState();
    emit(state);
  }

  getUser() async {
    Either<Unit, UserEntity> either = await userUseCase.getUser();
    either.fold((_) {
      emit(NewUserState());
    }, (UserEntity user) {
      emit(AlreadyLoggedInState(user: user.toModel()));
    });
  }

  Future<UserModel?> getUserFromLocal() async => await appPrefs.user;

  updateUserLocation(LocationModel location) async {
    UserState state = UpdatingUserLocation(
        message: appStatesMessages[AppStates.savingLocation]!);
    emit(state);
    Either<Failure, UserResponseEntity> either =
        await userUseCase.updateLocation(location);
    either.fold(
        (failure) => state =
            UpdatingUserLocationFailed(message: mapFailureToMessage(failure)),
        (UserResponseEntity userResponseEntity) => state =
            UpdatedUserLocation(userResponseEntity: userResponseEntity));
    emit(state);
  }

  UserState mapEventToState(Either<Failure, UserResponseEntity> either) {
    UserState? state;
    either.fold(
        (Failure failure) => state =
            RegisteringUserFailedState(message: mapFailureToMessage(failure)),
        (UserResponseEntity userResponseEntity) => state =
            UserRegisteredState(userResponseEntity: userResponseEntity));
    return state!;
  }


  static registerUserEvent(BuildContext context, UserModel user) {
    return BlocProvider.of<UserCubit>(context).registerUser(user);
  }
  static saveUserAddressEvent(BuildContext context, AddressModel address) {
    return BlocProvider.of<UserCubit>(context).saveUserAddress(address);
  }
  static loginUserEvent(
          {required BuildContext context,
          required String phone,
          required String password}) {
    return BlocProvider.of<UserCubit>(context)
          .loginUser(phone: phone, password: password);
  }
  static getUserEvent(BuildContext context) async {
    return await BlocProvider.of<UserCubit>(context).getUser();
  }
  static updateUserLocationEvent(
          BuildContext context, LocationModel location) {
    return BlocProvider.of<UserCubit>(context).updateUserLocation(location);
  }
  static Future<UserModel?> getUserFromStorage(BuildContext context) {
    return BlocProvider.of<UserCubit>(context).getUserFromLocal();
  }
}
