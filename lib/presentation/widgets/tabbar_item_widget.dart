
import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';

class CustomTabBarItemWidget extends StatefulWidget {
  ItemModel? _tab;
  void Function()? _onTap;
  CustomTabBarItemWidget({required ItemModel? tab, void Function()? onTap, super.key}) {
    _tab = tab;
    _onTap = onTap;
  }
  @override
  State<CustomTabBarItemWidget> createState() => _CustomTabBarItemWidgetState();
}

class _CustomTabBarItemWidgetState extends State<CustomTabBarItemWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget._onTap,
      child: AnimatedContainer(
        width: AppWidth.s120*Constants.width,
          padding: EdgeInsets.symmetric(
              vertical: AppHeight.s10*Constants.height, ),
          decoration: BoxDecoration(
              color: widget._tab!.active
                  ? ColorsManager.maximumPurple
                  : ColorsManager.cultured,
              borderRadius: BorderRadius.circular(15)),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInQuad,
          child: Text(
            widget._tab!.title,
            textAlign: TextAlign.center,
            style: getMediumStyle(
              color: widget._tab!.active
                  ? ColorsManager.white
                  : ColorsManager.eerieBlack,
              fontSize: AppWidth.s16*Constants.width,
            ),
          )),
    );
  }
}
