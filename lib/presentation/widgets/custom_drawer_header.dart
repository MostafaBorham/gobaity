import 'package:flutter/cupertino.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';


class DrawerHeaderWidget extends StatelessWidget{
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: AppHeight.s194*Constants.height,
          width: double.maxFinite,
          child: Image.asset(
            AssetsManager.food,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: AppHeight.s194*Constants.height,
          width: double.maxFinite,
          color: ColorsManager.black.withOpacity(0.32),
        ),
        Container(
          height: AppWidth.s100*Constants.width,
          width: AppWidth.s200*Constants.width,
          child: Image.asset(
            AssetsManager.gobaity1,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }

}