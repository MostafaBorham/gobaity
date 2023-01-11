import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_network_image.dart';
import 'package:yallabaity/presentation/widgets/favourite_widget.dart';
import 'package:yallabaity/presentation/widgets/rate_box.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';
import 'package:yallabaity/gobaity_app.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FoodItem extends StatelessWidget {
  final FoodEntity? food;
  final Function()? onTap;
  final bool? isFavourited;
  final double? width;
  final bool? isLoaded;
  final Function(bool value)? onFavouriteBtnPressed;

  const FoodItem({
    super.key,
    this.width,
    this.food,
    this.isLoaded = false,
    this.isFavourited = false,
    this.onTap,
    this.onFavouriteBtnPressed,
  });
  @override
  Widget build(BuildContext context) {
    return isLoaded!
        ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
                width: width,
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
                    Stack(
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          height: AppHeight.s106 * Constants.height,
                          child: CustomNetworkImage(
                            imageUrl: ApiConstants.fullUrl + food!.imagePath!,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppWidth.s17 * Constants.width, vertical: AppHeight.s15 * Constants.height),
                          child: Row(// set widgets horizontally
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RateBox(rate: food!.rate!, nReted: food!.rateCount!),
                              FavouriteWidget(
                                radius: AppWidth.s15 * Constants.width,
                                isFavourited: isFavourited!,
                                onFavouriteBtnPressed: (value) {
                                  if (onFavouriteBtnPressed != null) onFavouriteBtnPressed!(value);
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppWidth.s7 * Constants.width,
                        vertical: AppHeight.s9 * Constants.height,
                      ),
                      child: _buildFoodInfo(),
                    ),
                  ],
                )),
          )
        : _buildFoodShimmer();
  }

  _buildFoodInfo() => Column(//set widgets vertically
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(// set widgets horizontally
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppHeight.s34 * Constants.height,
                width: AppWidth.s34 * Constants.width,
                child: SvgPicture.asset(AssetsManager.chiefMaleRounddedAvatar),
              ),
              SizedBox(
                width: AppWidth.s11 * Constants.width,
              ),
              Expanded(
                  child: Column(//set widgets vertically
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    food!.foodName!.replaceAll('\n', '').replaceAll('\r', ''),
                    maxLines: 1,
                    style: getSemiBoldStyle(color: ColorsManager.black, fontSize: AppWidth.s15 * Constants.width),
                  ),
                  SizedBox(
                    height: AppHeight.s2 * Constants.height,
                  ),
                  Text(
                    food!.cookName!,
                    style: getMediumStyle(color: ColorsManager.black, fontSize: AppWidth.s12 * Constants.width),
                  ),
                  SizedBox(
                    height: AppHeight.s4 * Constants.height,
                  ),
                  Row(// set widgets horizontally
                    children: [
                      SvgPicture.asset(AssetsManager.motor),
                      SizedBox(
                        width: AppHeight.s10 * Constants.height,
                      ),
                      AutoSizeText(
                        '${food!.preparationTime}. mins',
                        maxLines: 1,
                        style: getMediumStyle(fontSize: AppWidth.s12 * Constants.width, color: ColorsManager.maximumPurple),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ],
      );
  _buildFoodShimmer() => Container(
      width: width,
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
