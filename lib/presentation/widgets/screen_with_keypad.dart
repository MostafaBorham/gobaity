import 'package:flutter/material.dart';
import 'package:yallabaity/application/utils.dart';

class ScreenWithKeypad extends StatelessWidget {
  final Widget? child;
  const ScreenWithKeypad({this.child,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.hideKeyboard();
      },
      child: child,
    );
  }
}
