import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';

import '../../domain/entities/requests_entites/category_entity.dart';

class TabItem extends StatelessWidget {
  final CategoryEntity? category;
  final int? index;
  final void Function()? onTap;
  final bool isLoaded;
  const TabItem({this.category, this.index,this.isLoaded=false, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: onTap,
      child: Tab(
        child:isLoaded? AutoSizeText(
          category!.categoryName!,
          style: getSemiBoldStyle(fontSize: 13, height: 2),
        ): ShimmerWidget(
          height: AppHeight.s10 * Constants.height,
          width: AppWidth.s40 * Constants.width,
        ),
      )
    );
  }
}
