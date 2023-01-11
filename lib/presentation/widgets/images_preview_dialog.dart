import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallabaity/application/types.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';

import '../manager/cubit_carousel_slider/carousel_images_slider_cubit.dart';

class ImagesPreviewDialog extends StatelessWidget {
  final List<String> images;
  final int initialPage;
  final VoidFunction onBackPressed;
  const ImagesPreviewDialog(
      {required this.images,
      this.initialPage = 0,
      this.onBackPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselImageSliderCubit()..changeIndex(initialPage),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: ColorsManager.transparent,
        elevation: 0,
        child: BlocBuilder<CarouselImageSliderCubit, CarouselImagesSliderState>(
          builder: (context, state) {
            return Column(//set widgets vertically
              children: [
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) =>
                          images[index].contains('http')
                              ? CachedNetworkImage(imageUrl: images[index])
                              : Image.file(
                                  File(images[index]),
                                  fit: BoxFit.cover,
                                ),
                      options: CarouselOptions(
                        initialPage: initialPage,
                        height: Constants.height * 0.5,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          CarouselImageSliderCubit.swipeEvent(context, index);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppHeight.s45 * Constants.height,
                        left: Constants.margin,
                        right: AppWidth.s33 * Constants.width,
                      ),
                      child: CircularIconButton(
                        asset: AssetsManager.back,
                        color: ColorsManager.white,
                        ontap: onBackPressed,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppHeight.s16 * Constants.height,
                ),
                if (images.length > 1)
                  SizedBox(
                    height: AppHeight.s8 * Constants.height,
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) => CircleAvatar(
                        radius: AppWidth.s4 * Constants.width,
                        backgroundColor: state.currentIndex == index
                            ? ColorsManager.white
                            : ColorsManager.white.withOpacity(0.8),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: AppWidth.s5 * Constants.width,
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
