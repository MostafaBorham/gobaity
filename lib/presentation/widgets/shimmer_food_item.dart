import 'package:flutter/material.dart';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';

import '../resources/colors_manager.dart';
import '../resources/constants_manager.dart';

class ShimmerFoodItem extends StatelessWidget {
  const ShimmerFoodItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppWidth.s252 * Constants.width,
        clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
        decoration: BoxDecoration(
            color: ColorsManager.white,
            border: Border.all(
              width: 1,
              color: ColorsManager.black.withOpacity(0.07),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Column(//set widgets vertically
          mainAxisSize: MainAxisSize.min,
          children: [
            ShimmerWidget(
              width: double.maxFinite,
              height: AppHeight.s106 * Constants.height,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.s7 * Constants.width,
                  vertical: AppHeight.s9 * Constants.height,
                ),
                child: Row(// set widgets horizontally
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.fromCircular(
                      radius: AppWidth.s17 * Constants.width,
                    ),
                    SizedBox(
                      width: AppWidth.s11 * Constants.width,
                    ),
                    Expanded(
                        child: Column(//set widgets vertically
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerWidget(
                          height: AppHeight.s12 * Constants.height,
                          width: AppWidth.s200 * Constants.width,
                        ),
                        SizedBox(
                          height: AppHeight.s10 * Constants.height,
                        ),
                        ShimmerWidget(
                          height: AppHeight.s10 * Constants.height,
                          width: AppWidth.s150 * Constants.width,
                        ),
                        SizedBox(
                          height: AppHeight.s10 * Constants.height,
                        ),
                        Row(// set widgets horizontally
                          children: [
                            ShimmerWidget(
                              width: AppWidth.s12 * Constants.width,
                              height: AppHeight.s12 * Constants.height,
                            ),
                            SizedBox(
                              width: AppHeight.s10 * Constants.height,
                            ),
                            ShimmerWidget(
                              height: AppHeight.s12 * Constants.height,
                              width: AppWidth.s100 * Constants.width,
                            )
                          ],
                        ),
                      ],
                    ))
                  ],
                )),
          ],
        ));
  }
}
