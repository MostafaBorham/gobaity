import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/gobaity_app.dart';

class CustomFilledCheckBox extends StatefulWidget {
  double? _height;
  double? _width;
  late bool _isChecked;
  Function(bool checked)? _onCheck;
  double? _borderRadius;
  CustomFilledCheckBox(
      {super.key, double? height,
      double? width,
      bool isChecked = false,
      double? borderRadius = 0,
      Function(bool checked)? onCheck}) {
    _isChecked = isChecked;
    _onCheck = onCheck;
    _height = height ?? AppWidth.s28*Constants.width;
    _width = width ?? AppWidth.s28*Constants.width;
    _borderRadius = borderRadius;
  }

  @override
  State<CustomFilledCheckBox> createState() => _CustomFilledCheckBoxState();
}

class _CustomFilledCheckBoxState extends State<CustomFilledCheckBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        widget._isChecked = !widget._isChecked;

        if (widget._onCheck != null) widget._onCheck!(widget._isChecked);
      },
      child: AnimatedContainer(
        height: widget._height,
        width: widget._width,
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
            border: Border.all(
              width: 2,
              color: ColorsManager.gainsboro,
            )),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
