import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';

enum Button { save, cancel }

class TwoButtonsSelectWidget extends StatefulWidget {
  Function(Button button)? whichButtonSelected;
  final String btn1Text;
  final String btn2Text;
  TwoButtonsSelectWidget(
      {required this.btn1Text,
      required this.btn2Text,
      this.whichButtonSelected,
      Key? key})
      : super(key: key);

  @override
  State<TwoButtonsSelectWidget> createState() => _TwoButtonsSelectWidgetState();
}

class _TwoButtonsSelectWidgetState extends State<TwoButtonsSelectWidget> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(// set widgets horizontally
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: Expanded(
            child: ElevatedButton(
              child: Text(
                widget.btn1Text,
                style: getMediumStyle(
                    fontSize: AppWidth.s14 * Constants.width,
                    color: selected == 0
                        ? ColorsManager.white
                        : ColorsManager.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: selected == 0
                      ? ColorsManager.maximumPurple
                      : ColorsManager.cultured,
                  padding: EdgeInsets.symmetric(
                    vertical: AppWidth.s14 * Constants.width,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                if (selected != 0) {
                  setState(() {
                    selected = 0;
                  });
                }
                if (widget.whichButtonSelected != null) {
                  widget.whichButtonSelected!(Button.save);
                }
              },
            ),
          ),
        ),
        SizedBox(
          width: Constants.margin,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: Expanded(
            child: ElevatedButton(
              child: Text(
                widget.btn2Text,
                style: getMediumStyle(
                    fontSize: AppWidth.s14 * Constants.width,
                    color: selected == 1
                        ? ColorsManager.white
                        : ColorsManager.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: selected == 1
                      ? ColorsManager.maximumPurple
                      : ColorsManager.cultured,
                  padding: EdgeInsets.symmetric(
                    vertical: AppWidth.s14 * Constants.width,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                if (selected != 1) {
                  setState(() {
                    selected = 1;
                  });
                }
                if (widget.whichButtonSelected != null) {
                  widget.whichButtonSelected!(Button.cancel);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
