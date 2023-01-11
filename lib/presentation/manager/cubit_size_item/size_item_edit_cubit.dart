import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'size_item_edit_state.dart';

class SizeItemCubit extends Cubit<SizeItemState> {
  SizeItemCubit() : super(AddSizeItemState());
  editState() {
    emit(EditSizeItemState());
  }

  addState() {
    emit(AddSizeItemState());
  }

  saveState() {
    emit(SaveSizeItemState());
  }

  static editSizeItemEvent(BuildContext context) =>
      BlocProvider.of<SizeItemCubit>(context).editState();
  static addSizeItemEvent(BuildContext context) =>
      BlocProvider.of<SizeItemCubit>(context).addState();
  static saveSizeItemEvent(BuildContext context) =>
      BlocProvider.of<SizeItemCubit>(context).saveState();
}
