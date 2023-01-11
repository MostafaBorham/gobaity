import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';

class CustomDataButton extends StatelessWidget {
  int? _count;
  String? _text;
  Widget? _suffix;
  Function()? _onTap;
  CustomDataButton(
      {int count = 0,
      required String text,
      Widget? suffix,
      Function()? onTap,
      Key? key})
      : super(key: key) {
    _count = count;
    _text = text;
    _suffix = suffix;
    _onTap = onTap;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorsManager.maximumPurple,
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(AppWidth.s24 * Constants.width),
        padding: EdgeInsets.only(
            left: AppWidth.s9*Constants.width, right: AppWidth.s22 * Constants.width),
        child: Row(// set widgets horizontally
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(// set widgets horizontally
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppWidth.s7 * Constants.width),
                  child: Container(
                    height: AppWidth.s43 * Constants.width,
                    width: AppWidth.s42 * Constants.width,
                    decoration: BoxDecoration(
                        color: ColorsManager.white.withOpacity(0.28),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        _count.toString(),
                        style: getMediumStyle(
                            color: ColorsManager.white,
                            fontSize: AppWidth.s21 * Constants.width),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: AppWidth.s22 * Constants.width,
                ),
                Text(
                  _text!,
                  style: getSemiBoldStyle(
                      fontSize: AppWidth.s16 * Constants.width,
                      color: ColorsManager.white),
                )
              ],
            ),
            if (_suffix != null) _suffix!
          ],
        ),
      ),
    );
  }
}
