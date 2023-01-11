part of 'dialog_manager_cubit.dart';

@immutable
abstract class DialogManagerState {
  final bool? show;

  const DialogManagerState(this.show);
}

class DialogState extends DialogManagerState {
  const DialogState({bool? show}) : super(show);
}


