import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_circular_progressbar.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  const CustomNetworkImage({required this.imageUrl,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      placeholder: (context, url) => Center(
        child: CustomCircularProgressbar(
          radius: 50,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: ColorsManager.maximumPurple,

        child: Image.asset(
          AssetsManager.gobaity1,
          height: AppWidth.s50*Constants.height,
          width: AppWidth.s50 * Constants.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
