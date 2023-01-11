import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';

class CustomTileButton extends StatefulWidget {
  String? _prefixAsset;
  String? _suffixAsset;
  String? _text;
  EdgeInsetsGeometry? _padding;
  void Function()? _onTap;
  Widget? _suffix;
  bool? isLoaded;
  CustomTileButton({
    String? prefixAsset,
    required String text,
    String suffixAsset = AssetsManager.arrow,
    EdgeInsetsGeometry? padding,
    void Function()? onTap,
    Widget? suffix,
    this.isLoaded=true,
    super.key,
  }) {
    _suffixAsset = suffixAsset;
    _text = text;
    _onTap = onTap;
    _suffix = suffix;
    _prefixAsset = prefixAsset;
    _padding = padding ??
        EdgeInsets.only(
          left: Constants.margin,
          right: AppWidth.s29*Constants.width,
        );
  }

  @override
  State<CustomTileButton> createState() => _CustomTileButtonState();
}

class _CustomTileButtonState extends State<CustomTileButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget._onTap,
      child: Container(
        height: AppHeight.s56*Constants.height,
        padding: widget._padding,
        decoration: BoxDecoration(
            color: ColorsManager.white,
            boxShadow: [
              BoxShadow(
                color: ColorsManager.black.withOpacity(0.07),
                offset: Offset(0, 0),
                blurRadius: 20,
              ),
            ],
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: ColorsManager.white)),
        child: Row(// set widgets horizontally
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(// set widgets horizontally
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget._prefixAsset != null)
                  Row(// set widgets horizontally
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(widget._prefixAsset!),
                      SizedBox(
                        width: AppWidth.s14*Constants.width,
                      )
                    ],
                  ),
                Flexible(
                  child: Text(

                    widget._text!,
                    style: getMediumStyle(
                        color: ColorsManager.davysGrey, fontSize: AppWidth.s14*Constants.width),
                  ),
                )
              ],
            ),
            widget._suffix == null
                ?             AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: widget.isLoaded!
                    ? SvgPicture.asset(
                  AssetsManager.add,
                  fit: BoxFit.none,
                )
                    : SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    color: ColorsManager.maximumPurple,
                    strokeWidth: 1,
                  ),
                ))

                : widget._suffix!
          ],
        ),
      ),
    );
  }
}
