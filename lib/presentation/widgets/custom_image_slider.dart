import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';

import '../../application/app_api_constants/api_constants.dart';
import '../../application/types.dart';
import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/constants_manager.dart';
import '../resources/values_manager.dart';
import 'circular_icon_button.dart';
import 'custom_network_image.dart';

class CustomImageSliderWithBackAndFavouriteButton extends StatelessWidget {
  final List<String>? images;
  final VoidFunction onBackPressed;
  final VoidFunction onFavouritePressed;
  final bool isLoaded;
  const CustomImageSliderWithBackAndFavouriteButton({this.images, this.isLoaded=false,this.onBackPressed, this.onFavouritePressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoaded?Stack(
      alignment: Alignment.topCenter,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: AppHeight.s280 * Constants.height,
            viewportFraction: 1,
            initialPage: 0,
            scrollDirection: Axis.horizontal,
            reverse: true,
          ),
          itemCount: images!.length,
          itemBuilder: (BuildContext context, int index, int realIndex) =>
              CustomNetworkImage(imageUrl: ApiConstants.fullUrl + images![index]),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppHeight.s45 * Constants.height,
            left: Constants.margin,
            right: AppWidth.s33 * Constants.width,
          ),
          child: Row(// set widgets horizontally
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularIconButton(
                asset: AssetsManager.back,
                color: ColorsManager.white,
                ontap: onBackPressed,
              ),
              CircularIconButton(
                asset: AssetsManager.favourite,
                color: ColorsManager.white,
                ontap: onFavouritePressed,
              ),
            ],
          ),
        ),
      ],
    ):ShimmerWidget(
      height: AppHeight.s280 * Constants.height,
      width: Constants.width,
    );
  }
}
