import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_model.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/rate_box.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';
import 'package:yallabaity/gobaity_app.dart';

class CookItem extends StatelessWidget {
  Function()? onTap;
  CookModel? cook;
  bool? isLoaded;
  CookItem({this.cook, this.isLoaded = false, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLoaded!
        ? GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: AppWidth.s71 * Constants.width,
              child: Column(//set widgets vertically
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppHeight.s20 * Constants.height),
                        child: SizedBox(
                          height: AppWidth.s71 * Constants.width,
                          width: AppWidth.s71 * Constants.width,
                          child: SvgPicture.asset(AssetsManager.chiefMaleAvatar,),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: RateBox(
                            rate: cook!.rate!,
                            nReted: cook!.rateCount!,
                            backgroundColor: ColorsManager.cultured2,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: AppHeight.s10 * Constants.height,
                  ),
                  Text(
                    cook!.cookName!,
                    textAlign: TextAlign.center,
                    style: getSemiBoldStyle(fontSize: AppWidth.s13 * Constants.width, color: ColorsManager.eerieBlack),
                  )
                ],
              ),
            ),
          )
        : Column(//set widgets vertically
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: AppHeight.s10 * Constants.height),
              child: ShimmerWidget.fromCircular(
                radius: (AppWidth.s71 * Constants.width) / 2,
              ),
            ),
            Positioned(
                bottom: 0,
                child: ShimmerWidget(
                  height: AppHeight.s30*Constants.height,
                  width: AppWidth.s60*Constants.width,
                  borderRadius: BorderRadius.circular(15),
                )),
          ],
        ),
        SizedBox(
          height: AppHeight.s15 * Constants.height,
        ),
        ShimmerWidget(
          height: AppHeight.s20 * Constants.height,
          width: AppWidth.s60 * Constants.width,
          borderRadius: BorderRadius.circular(15),
        )
      ],
    );
  }
}
