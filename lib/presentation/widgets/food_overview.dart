import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/gobaity_app.dart';
import '../resources/styles_manager.dart';
import 'shimmer_widget.dart';

class FoodOverview extends StatelessWidget {
  final double? review;
  final int? nReview;
  final int? distance;
  final int? time;
  final bool? isLoaded;
  const FoodOverview({super.key, this.review, this.isLoaded = false, this.nReview, this.distance, this.time});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLoaded!
        ? Row(// set widgets horizontally
            children: [
              Expanded(
                child: _buildFoodOverViewItem(
                  asset: AssetsManager.review,
                  title: '$review',
                  subtitle: '($nReview) Review',
                ),
              ),
              _buildVertialDivider(),
              Expanded(
                child: _buildFoodOverViewItem(
                  asset: AssetsManager.location,
                  title: '$distance km',
                  subtitle: 'Distance',
                ),
              ),
              _buildVertialDivider(),
              Expanded(
                child: _buildFoodOverViewItem(
                  asset: AssetsManager.time,
                  title: '${time} mins',
                  subtitle: 'Delivery Time',
                ),
              ),
            ],
          )
        : Row(// set widgets horizontally
            children: [
              Expanded(child: _buildFoodOverViewShimmer()),
              _buildVertialDivider(),

              Expanded(child: _buildFoodOverViewShimmer()),
              _buildVertialDivider(),

              Expanded(child: _buildFoodOverViewShimmer()),
              _buildVertialDivider(),

            ],
          );
  }

  _buildVertialDivider() => Container(
        height: 0.08 * Constants.height,
        padding: EdgeInsets.symmetric(vertical: 0.02 * Constants.height),
        child: VerticalDivider(
          color: ColorsManager.black.withOpacity(0.1),
        ),
      );
  _buildFoodOverViewItem({required String asset, required String title, required String subtitle}) => Column(//set widgets vertically
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: AppHeight.s28 * Constants.height,
            width: AppWidth.s28 * Constants.width,
            child: SvgPicture.asset(
              asset,
            ),
          ),
          SizedBox(
            height: AppHeight.s7 * Constants.height,
          ),
          AutoSizeText(

            title,
            style: getBoldStyle(color: ColorsManager.black, fontSize: AppWidth.s21 * Constants.width, height: 0),
            textAlign: TextAlign.center,
            maxLines: 1,

          ),
          SizedBox(
            height: AppHeight.s3 * Constants.height,
          ),
          AutoSizeText(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: getMediumStyle(color: ColorsManager.black, fontSize: AppWidth.s13 * Constants.width, height: 0),
          ),
        ],
      );
  _buildFoodOverViewShimmer() => Column(//set widgets vertically
        children: [
          ShimmerWidget.fromCircular(
            radius: AppWidth.s14 * Constants.width,
          ),
          SizedBox(
            height: AppHeight.s7 * Constants.height,
          ),
          ShimmerWidget(
            height: AppHeight.s15 * Constants.height,
            width: AppWidth.s60* Constants.width,
            borderRadius: BorderRadius.circular(10),
          ),
          SizedBox(
            height: AppHeight.s10 * Constants.height,
          ),
          ShimmerWidget(
            height: AppHeight.s6 * Constants.height,
            width: AppWidth.s30 * Constants.width,
            borderRadius: BorderRadius.circular(10),

          ),
        ],
      );
}
