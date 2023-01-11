import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class CustomRichText extends StatelessWidget {
  String? text;
  String? btnText;
  void Function()? onPressed;
  Color? textBtnColor;
  CustomRichText(
      {super.key, required this.text,
      this.btnText,
      this.onPressed,
      this.textBtnColor = ColorsManager.eerieBlack});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: getMediumStyle(
              fontSize: AppWidth.s14 * Constants.width,
              color: ColorsManager.eerieBlack),
          children: [
            TextSpan(
              text: text,
            ),
            TextSpan(
              text: btnText,
              style: getMediumStyle(
                  fontSize: AppWidth.s14 * Constants.width,
                  color: textBtnColor!,
                  textDecoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = onPressed,
            ),
          ]),
    );
  }
}
