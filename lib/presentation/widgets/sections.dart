import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class SectionName extends StatelessWidget {
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  const SectionName(
      {super.key, required this.title, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(//set widgets vertically
      children: [
        Row(// set widgets horizontally
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: getSemiBoldStyle(
                  color: ColorsManager.eerieBlack,
                  fontSize: AppWidth.s17 * Constants.width),
            ),
            if (subtitle != null)
              InkWell(
                onTap: onTap,
                child: Text(
                  subtitle!,
                  style: getMediumStyle(
                    fontSize: AppWidth.s12 * Constants.width,
                    color: ColorsManager.graniteGray,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
