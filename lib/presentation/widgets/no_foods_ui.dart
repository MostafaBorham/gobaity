import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class NoFoodsUi extends StatelessWidget {
  const NoFoodsUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.s200 * Constants.height,
      width: AppWidth.s200 * Constants.width,
      child: Lottie.asset(AssetsManager.empty),
    );
  }
}
