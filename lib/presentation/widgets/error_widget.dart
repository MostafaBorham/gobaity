import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

import '../resources/constants_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? message;
  final bool? visible;
  final AlignmentGeometry? alignment;
  const CustomErrorWidget({
    this.alignment = Alignment.center,
    this.message,
    bool this.visible = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: visible!
          ? Align(
              alignment: alignment!,
              child: Column(//set widgets vertically
                children: [
                  SizedBox(
                    height: AppHeight.s10 * Constants.height,
                  ),
                  Text(
                    message!.capitalizeFirst!,
                    style: getMediumStyle(
                        fontSize: AppWidth.s14 * Constants.width,
                        color: ColorsManager.red),
                  ),
                  SizedBox(
                    height: AppHeight.s10 * Constants.height,
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
