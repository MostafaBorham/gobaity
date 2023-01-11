import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class CustomButton extends StatelessWidget {
  String? _text;
  void Function()? _onPressed;
  Color? _textColor;
  Color? _color;
  bool? _outlined;
  CustomButton(
      {required String text,
      bool outlined = false,
      Color color = ColorsManager.maximumPurple,
      Color textColor = ColorsManager.white,
      void Function()? onPressed,
      Key? key})
      : super(key: key) {
    _text = text;
    _onPressed = onPressed;
    _color = color;
    _textColor = textColor;
    _outlined = outlined;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        backgroundColor: _outlined! ? ColorsManager.transparent : _color,
        padding: EdgeInsets.symmetric(vertical: AppWidth.s16*Constants.width),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
            side: _outlined!
                ? BorderSide(color: ColorsManager.fireOpal, width: 1)
                : BorderSide.none),
      ),
      child: Text(
        _text!,
        style: getMediumStyle(
          color: _outlined! ? ColorsManager.fireOpal : _textColor!,
          fontSize: AppWidth.s16*Constants.width,
        ),
      ),
    );
  }
}
