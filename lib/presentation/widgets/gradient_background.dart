import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class GradientBackground extends StatelessWidget {
  Widget? _child;
  GradientBackground({required Widget child,Key? key}) : super(key: key){
    _child=child;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.2,
          child: Container(
            height: AppHeight.s31*Constants.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorsManager.maximumPurple.withOpacity(0.8),
                  ColorsManager.white.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
            ),
          ),
        ),
        _child!
      ],
    );
  }
}
