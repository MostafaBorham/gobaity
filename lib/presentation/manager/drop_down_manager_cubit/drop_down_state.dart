part of 'drop_down_cubit.dart';

@immutable
abstract class DropDownState {

}

class DropDownInitial extends DropDownState {

}
class DropDownChangeState extends DropDownState{
  bool expand=false;
  DropDownChangeState({required this.expand});
}

