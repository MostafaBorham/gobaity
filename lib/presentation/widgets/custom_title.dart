import 'package:flutter/cupertino.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class CustomTitle extends StatelessWidget {
  String? _text;
  CustomTitle({super.key, required String text}){
    _text=text;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      _text!,
      style: getMediumStyle(
          color: ColorsManager.maximumPurple,
          fontSize: AppWidth.s28*Constants.width),
    );
  }
}