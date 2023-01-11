import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'button_change_state.dart';

class ButtonShowCubit extends Cubit<ButtonShowState> {
  ButtonShowCubit() : super(ShowButtonState(show: true));
  bool show=true;
  changeButton(){
    show=!show;
    emit(ShowButtonState(show: show));
  }
/*
  static changeButtonVisbilityEvent(BuildContext context) =>
      BlocProvider.of<ButtonShowCubit>(context).changeButton();
  static getCurrentButtonState(BuildContext context) =>
      BlocProvider.of<ButtonShowCubit>(context).state.show;

*/

}
