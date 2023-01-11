import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'dialog_manager_state.dart';

class DialogManagerCubit extends Cubit<DialogManagerState> {
  bool show = false;

  DialogManagerCubit() : super(DialogState(show: false));
  changeDialogVisibility() {
    show = !show;
    emit(DialogState(show: show));
  }

  static changeDialogStateEvent(BuildContext context) => BlocProvider.of<DialogManagerCubit>(context).changeDialogVisibility();
}
