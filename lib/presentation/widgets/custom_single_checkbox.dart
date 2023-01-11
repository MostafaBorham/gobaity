import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';

class CustomSingleCheckBox extends StatefulWidget {
  String? _text;
  Function(bool isChecked)? _onCheck;
  bool? _isChecked ;

  CustomSingleCheckBox({required String text,bool isChecked = false,Function(bool)? onCheck,Key? key}) : super(key: key){
    _text=text;
    _onCheck=onCheck;
    _isChecked=isChecked;
  }

  @override
  State<CustomSingleCheckBox> createState() => _CustomSingleCheckBoxState();
}

class _CustomSingleCheckBoxState extends State<CustomSingleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(// set widgets horizontally
      children: [
        CustomCheckBox(
          onCheck: widget._onCheck,
          isChecked: widget._isChecked!,
        ),
        SizedBox(
          width: AppWidth.s21*Constants.width,
        ),
        Flexible(
          child: Text(
            widget._text!,
            style: getMediumStyle(
              color: ColorsManager.black,
              fontSize: AppWidth.s16*Constants.width,
            ),
          ),
        ),
      ],
    );
  }
}
class CustomCheckBox extends StatefulWidget {
  late bool _isChecked;
  Function(bool checked)? _onCheck;
  CustomCheckBox({super.key, bool isChecked = false, Function(bool checked)? onCheck}) {
    _isChecked = isChecked;
    _onCheck = onCheck;
  }

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: AppWidth.s28*Constants.width,
      width: AppWidth.s28*Constants.width,
      decoration: BoxDecoration(
          color: ColorsManager.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: widget._isChecked
                ? ColorsManager.maximumPurple
                : ColorsManager.gainsboro,
          )),
      child: Container(
        margin: EdgeInsets.all(AppWidth.s4*Constants.width),
        decoration: BoxDecoration(
          color: widget._isChecked
              ? ColorsManager.maximumPurple
              : ColorsManager.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

