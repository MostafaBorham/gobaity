part of 'errors_manager_cubit.dart';

@immutable
abstract class ErrorsManagerState {
  final Map<AppErrors, String> errors;

  const ErrorsManagerState({
    required this.errors,
  });
  getMessage(AppErrors error) => appErrorMessages[error];
}

class ErrorsState extends ErrorsManagerState {
  const ErrorsState({required super.errors});
}
