import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';

class MyCart extends StatelessWidget {
  Function()? _onTap;
  Color? _assetColor;
  Color? _backColor;
  MyCart({super.key,
    Color assetColor = ColorsManager.maximumPurple,
    Color backColor = ColorsManager.cultured,
    Function()? onTap,
  }) {
    _onTap = onTap;
    _assetColor = assetColor;
    _backColor = backColor;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomLeft,
      clipBehavior: Clip.none,
      children: [
        CircularIconButton(
          asset: AssetsManager.cart,
          radius: AppWidth.s46*Constants.width / 2,
          ontap: _onTap,
          height: AppWidth.s28*Constants.width,
          width: AppWidth.s24*Constants.width,
          assetColor: _assetColor!,
          color: _backColor!,
        ),
        Positioned(
          left: -3,
          bottom: 0,
          child: CircleAvatar(
            backgroundColor: ColorsManager.red,
            radius: AppWidth.s14*Constants.width / 2,
          ),
        )
      ],
    );
  }
}
