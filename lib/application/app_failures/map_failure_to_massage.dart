import 'package:dartz/dartz.dart';

import 'failures.dart';
import 'failures_messages.dart';

String mapFailureToMessage(Failure failure) {
  String message = '';
  switch (failure.runtimeType) {
    case ServerFailure:
      message = serverErrorMessage;
      break;
    case EmptyCashFailure:
      message = emptyCacheFailureMessage;
      break;
    case OfflineFailure:
      message = offlineFailureMessage;
      break;
    case WritingCashFailure:
      message = writingCacheFailure;
      break;
    default:
      message = unExpectedErrorMessage;
  }
  return message;
}
