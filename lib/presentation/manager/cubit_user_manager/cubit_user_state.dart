part of 'cubit_user.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {}

class UserRegisteringState extends UserState {}
class UserLoginState extends UserState {}

class UserRegisteredState extends UserState {
  final UserResponseEntity userResponseEntity;
  const UserRegisteredState({
    required this.userResponseEntity,
  });
}

class RegisteringUserFailedState extends UserState {
  final String message;

  const RegisteringUserFailedState({
    required this.message,
  });
}
class NewUserState extends UserState {}
class AlreadyLoggedInState extends UserState {
  final UserModel user;

  const AlreadyLoggedInState({
    required this.user,
  });
}
class UserLoggedInState extends UserState{
  final UserResponseEntity userResponseEntity;
  const UserLoggedInState(this.userResponseEntity);
}

class UpdatingUserLocation extends UserState {
  final String message;
  const UpdatingUserLocation({required this.message});
}

class UpdatedUserLocation extends UserState {
  final UserResponseEntity userResponseEntity;
  const UpdatedUserLocation({required this.userResponseEntity});
}

class UpdatingUserLocationFailed extends UserState {
  final String message;

  const UpdatingUserLocationFailed({required this.message});
}
///save address states
class UserSavingAddressState extends UserState {}
class UserSavedAddressState extends UserState {
  final AddressResponseEntity addressResponseEntity;
  const UserSavedAddressState({
    required this.addressResponseEntity,
  });
}
class UserFailedSaveAddressState extends UserState {
  final String message;

  const UserFailedSaveAddressState({
    required this.message,
  });
}