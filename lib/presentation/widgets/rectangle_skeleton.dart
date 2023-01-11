import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';

class RoundedRectangleSkeleton extends StatelessWidget {
  final double? height;
  final double? width;
  const RoundedRectangleSkeleton({this.height, this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: ColorsManager.black.withOpacity(0.4), borderRadius: BorderRadius.circular(16)),
    );
  }
}
