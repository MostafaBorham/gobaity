import 'package:equatable/equatable.dart';

abstract class Failure {}

class OfflineFailure extends Failure {}

class ServerFailure extends Failure {}

class EmptyCashFailure extends Failure {}
class WritingCashFailure extends Failure {}

class WrongDataFailure extends Failure {}

class InvalidRequestFailure extends Failure {}
