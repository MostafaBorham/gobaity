import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/header.dart';

class CustomBackground extends StatelessWidget {
  Function()? _onBackBtnPressed;
  Widget? _child;
  CustomBackground(
      {super.key, Function()? onBackBtnPressed, required Widget child}) {
    _onBackBtnPressed = onBackBtnPressed;
    _child = child;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Header(onBackBtnPressed: _onBackBtnPressed),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(top: AppHeight.s238*Constants.height),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
              decoration: const BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: _child,
            ),
          ),
        )
      ],
    );
  }
}
