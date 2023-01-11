import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/gobaity_app.dart';

class CustomCheckBox extends StatefulWidget {
  double? _height;
  double? _width;
  late bool _isChecked;
  Function(bool checked)? _onCheck;
  double? _borderRadius;
  double? _space;
  CustomCheckBox(
      {super.key, double? height,
      double? width,
      double? space,
      bool isChecked = false,
      double? borderRadius = 0,
      Function(bool checked)? onCheck}) {
    _isChecked = isChecked;
    _onCheck = onCheck;
    _height = height ?? AppWidth.s28 * Constants.width;
    _width = width ?? AppWidth.s28 * Constants.width;
    _borderRadius = borderRadius;
    _space = space ?? AppWidth.s2 * Constants.width;
  }

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          if (widget._onCheck != null) {
            widget._isChecked = !widget._isChecked;
            widget._onCheck!(widget._isChecked);
          }
        });
      },
      child: AnimatedContainer(
        height: widget._height,
        width: widget._width,
        decoration: BoxDecoration(
            color: ColorsManager.white,
            shape: widget._borderRadius! > 0
                ? BoxShape.rectangle
                : BoxShape.circle,
            borderRadius: widget._borderRadius! > 0
                ? BorderRadius.circular(widget._borderRadius!)
                : null,
            border: Border.all(
              color: widget._isChecked
                  ? ColorsManager.maximumPurple
                  : ColorsManager.gainsboro,
            )),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: Container(
          margin: EdgeInsets.all(widget._space!),
          decoration: BoxDecoration(
            color: widget._isChecked
                ? ColorsManager.maximumPurple
                : ColorsManager.white,
            shape: widget._borderRadius! > 0
                ? BoxShape.rectangle
                : BoxShape.circle,
            borderRadius: widget._borderRadius! > 0
                ? BorderRadius.circular(widget._borderRadius!)
                : null,
          ),
        ),
      ),
    );
  }
}
