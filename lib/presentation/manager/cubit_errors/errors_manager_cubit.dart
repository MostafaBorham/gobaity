import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallabaity/application/app_failures/app_errors.dart';
import 'package:yallabaity/application/extensions.dart';

part 'errors_manager_state.dart';

class ErrorsManagerCubit extends Cubit<ErrorsManagerState> {
  ErrorsManagerCubit() : super(const ErrorsState(errors: {}));
  Map<AppErrors, String> errors = {};
  update({required AppErrors error}) {
    errors[error] = appErrorMessages[error]!;
    emit(ErrorsState(errors: errors));
  }

  remove(AppErrors error) {
    errors.remove(error);
    emit(ErrorsState(errors: errors));
  }

  static ErrorsManagerState getErrorState(BuildContext context) =>
      BlocProvider.of<ErrorsManagerCubit>(context).state;
  static bool contains(BuildContext context, AppErrors error) =>
      BlocProvider.of<ErrorsManagerCubit>(context)
          .state
          .errors
          .containsKey(error);

  static removeError(BuildContext context, AppErrors error) {
    BlocProvider.of<ErrorsManagerCubit>(context).remove(error);
  }

  static String getErrorMessage(BuildContext context, AppErrors error) =>
      BlocProvider.of<ErrorsManagerCubit>(context).state.getMessage(error);
  static addErrorType(BuildContext context, AppErrors error) =>
      BlocProvider.of<ErrorsManagerCubit>(context).update(error: error);
  static bool hasErrors(BuildContext context) {
    return BlocProvider.of<ErrorsManagerCubit>(context).state.errors.isNotEmpty;
  }
}
