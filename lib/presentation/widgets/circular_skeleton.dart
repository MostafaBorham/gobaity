import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';

class CircularSkeleton extends StatelessWidget {
  final double? radius;
  const CircularSkeleton({this.radius, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: ColorsManager.black.withOpacity(0.4),
    );
  }
}
