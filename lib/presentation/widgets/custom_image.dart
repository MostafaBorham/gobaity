import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yallabaity/application/types.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';


class CustomImage extends StatelessWidget {
  final String asset;
  final VoidFunction onDelete;
  final VoidFunction onImageTapped;
  const CustomImage({required this.asset, this.onDelete,this.onImageTapped, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: onImageTapped,
          child: Container(
            height: AppWidth.s66 * Constants.width,
            width: AppWidth.s66 * Constants.width,
            clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
            ),
            child:Image.file(
                File(asset),
                fit: BoxFit.cover
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -10,
          child: CircularIconButton(
            radius: AppWidth.s34 * Constants.width / 2,
            asset: AssetsManager.decrease,
            assetColor: ColorsManager.jasper,
            ontap: onDelete,
          ),
        )
      ],
    );
  }
}
