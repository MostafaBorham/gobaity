import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/icon_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? prefix;
  final String? title;
  final Color? titleColor;
  final double? titleFontSize;
  final String? subtitle;
  final String? subtitleSuffixAsset;
  final Widget? suffix;
  final Color? backgroundColor;
  final bool? showBackgroundImage;
  final double? elevation;
  final Function()? onBackPressed;
  final Function()? onTitlePressed;
  final bool? showSubtitleDropDownArrow;
  final Color? subtitleColor;
  CustomAppBar({
    this.backgroundColor = ColorsManager.white,
    this.showBackgroundImage = false,
    this.elevation = 0.3,
    this.prefix,
    this.title,
    this.titleColor,
    this.titleFontSize,
    this.subtitle,
    this.showSubtitleDropDownArrow = false,
    this.suffix,
    this.subtitleColor = ColorsManager.eerieBlack,
    this.subtitleSuffixAsset,
    this.onTitlePressed,
    this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: showBackgroundImage! ? ColorsManager.maximumPurple : backgroundColor,
      systemOverlayStyle: const SystemUiOverlayStyle(),
      automaticallyImplyLeading: false,
      elevation: elevation,
      flexibleSpace: Stack(
        children: [
          if (showBackgroundImage!)
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AssetsManager.cartAppBar,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              right: Constants.margin,
              left: Constants.margin,
              top: subtitle != null ? AppHeight.s30 * Constants.height : AppHeight.s50 * Constants.height,
            ),
            child: Row(
              // set widgets horizontally
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // set widgets horizontally
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    prefix != null
                        ? prefix!
                        : CustomIconButton(
                            asset: AssetsManager.back,
                            color: (backgroundColor == ColorsManager.maximumPurple || showBackgroundImage!)
                                ? ColorsManager.white
                                : ColorsManager.black,
                            onTap: onBackPressed != null
                                ? onBackPressed!
                                : () {
                                    Navigator.of(context).pop();
                                  },
                          ),
                    SizedBox(
                      width: AppWidth.s20 * Constants.width,
                    ),
                    GestureDetector(
                      onTap: onTitlePressed,
                      child: Column(
                          //set widgets vertically
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (title != null)
                              AutoSizeText(
                                title!,
                                maxLines: 1,
                                style: getSemiBoldStyle(
                                    color: titleColor != null
                                        ? titleColor!
                                        : (backgroundColor == ColorsManager.maximumPurple || showBackgroundImage!)
                                            ? ColorsManager.white
                                            : ColorsManager.eerieBlack,
                                    fontSize: titleFontSize != null ? titleFontSize! : 20),
                              ),
                            if (subtitle != null)
                              Row(
                                // set widgets horizontally
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AutoSizeText(
                                    subtitle!,
                                    maxLines: 1,
                                    style: getSemiBoldStyle(color: subtitleColor!, fontSize: 15, height: 1.4),
                                    softWrap: true,
                                  ),
                                  Row(
                                    // set widgets horizontally
                                    children: [
                                      SizedBox(
                                        width: AppWidth.s7 * Constants.width,
                                      ),
                                      if (showSubtitleDropDownArrow == true) SvgPicture.asset(AssetsManager.dropDown)
                                    ],
                                  ),
                                ],
                              ),
                          ]),
                    ),
                  ],
                ),
                if (suffix != null) suffix!
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppHeight.s90 * Constants.height);
}
