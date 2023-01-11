import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drop_down_state.dart';

class DropDownCubit extends Cubit<DropDownState> {
  DropDownCubit() : super(DropDownInitial());
  bool expand=false;
  changeDropDown()=>emit(DropDownChangeState(expand: !expand));
}
