import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';

class ShimmerWidget extends StatelessWidget {
  double? height;
  double? width;
  BoxShape? boxShape;
  double? radius;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  List<BoxShadow>? boxShadow;
  ShimmerWidget({this.height, this.width, this.borderRadius, this.padding, this.margin,this.boxShadow, Key? key}) : super(key: key) {
    boxShape = BoxShape.rectangle;
  }
  ShimmerWidget.fromRectangle({super.key, this.height, this.width = double.infinity, this.borderRadius}) {
    boxShape == BoxShape.rectangle;
  }
  ShimmerWidget.fromCircular({super.key, this.radius}) {
    boxShape = BoxShape.circle;
  }
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.black.withOpacity(0.4),
      highlightColor: ColorsManager.grey.withOpacity(0.3),
      child: boxShape == BoxShape.rectangle
          ? Container(
              height: height,
              width: width,
              padding: padding,
              margin: margin,
              clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
              decoration: BoxDecoration(borderRadius: borderRadius, color: ColorsManager.grey.withOpacity(0.2),
              boxShadow: boxShadow
              ),
            )
          : CircleAvatar(
              backgroundColor: ColorsManager.grey.withOpacity(0.2),
              radius: radius,
            ),
    );
  }
}
