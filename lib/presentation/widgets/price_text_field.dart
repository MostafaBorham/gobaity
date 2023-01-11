import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class PriceTextField extends StatelessWidget {
  String? Function(String?)? _validator;
  void Function(String)? _onChanged;
  void Function(String?)? _onSaved;
  int? _maxLines;
  String? _text;
  PriceTextField(
      {super.key, String? text,
      int? maxLines,
      String? Function(String? text)? validator,
      void Function(String text)? onChanged,
      void Function(String? text)? onSaved}) {
    _validator = validator;
    _onSaved = onSaved;
    _onChanged = onChanged;
    _text = text;
    _maxLines = maxLines;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.whiteGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        maxLines: _maxLines,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.numberWithOptions(decimal: false),
        decoration: InputDecoration(
          hintText: _text,
          hintStyle: getMediumStyle(
            color: ColorsManager.graniteGray2,
            fontSize: AppWidth.s14 * Constants.width,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: AppWidth.s18*Constants.width),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
