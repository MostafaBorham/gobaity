part of 'button_show_cubit.dart';

@immutable
abstract class ButtonShowState {
  final bool show;

  const ButtonShowState({
    required this.show,
  });
}

class ShowButtonState extends ButtonShowState {
  const ShowButtonState({required super.show});

}
