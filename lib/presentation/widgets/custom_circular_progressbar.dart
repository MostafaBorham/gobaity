import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/widgets/gradient_circular_progress_indicator.dart';

class CustomCircularProgressbar extends StatelessWidget {
  double? radius;
  CustomCircularProgressbar({this.radius=24,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientCircularProgressIndicator(
      radius: radius!,
      strokeWidth: 4,

      gradientColors: [ColorsManager.maximumPurple, ColorsManager.maximumPurple.withOpacity(0)],
    );
  }
}
