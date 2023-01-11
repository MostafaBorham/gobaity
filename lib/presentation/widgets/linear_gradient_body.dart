import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/gradient_background.dart';
import 'package:yallabaity/presentation/widgets/icon_button.dart';
import 'package:yallabaity/presentation/widgets/mycart.dart';

import 'package:yallabaity/presentation/widgets/custom_appbar.dart';

class LinearGradientBody extends StatelessWidget {
  String? _appbarTitle;
  Widget? _child;
  bool? _showCart;
  bool? _showBack;
  Function()? _onBackPressed;
  Function()? _onCartPressed;
  LinearGradientBody({
     String? appbarTitle,
    required Widget? child,
    bool showCart = true,
    bool? showBack = true,
    Function()? onBackPressed,
    Function()? onCartPressed,
    Key? key,
  }) : super(key: key) {
    _appbarTitle = appbarTitle;
    _child = child;
    _showCart = showCart;
    _showBack = showBack;
    _onBackPressed = onBackPressed;
   debugPrint(onBackPressed.toString());
    _onCartPressed=onCartPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: GradientBackground(
        child: _child!,
      ),
    );
  }

  _buildAppBar(BuildContext context) => CustomAppBar(
        backgroundColor: ColorsManager.transparent,
        showBackgroundImage: false,
        elevation: 0,
        prefix: _showBack!
            ? CustomIconButton(
                asset: AssetsManager.back,
                color: ColorsManager.black,
                onTap: _onBackPressed,
              )
            : null,
        title: _appbarTitle!,
        suffix: Visibility(
          visible: _showCart!,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: MyCart(
            assetColor: ColorsManager.black,
            backColor: ColorsManager.white,
            onTap: _onCartPressed,
          ),
        ),
      );
}
