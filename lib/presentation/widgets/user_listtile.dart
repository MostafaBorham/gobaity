import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/constants_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class UserListTile extends StatelessWidget {
  final String? userName;
  final bool isLoaded;
  const UserListTile({this.isLoaded = false, required this.userName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Container(
            decoration: BoxDecoration(
                color: ColorsManager.white,
                boxShadow: [
                  BoxShadow(color: ColorsManager.black.withOpacity(0.07), blurRadius: 21),
                ],
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: ColorsManager.white)),
            child: ListTile(
              leading: SvgPicture.asset(
                AssetsManager.chiefMaleRounddedAvatar,
                height: AppWidth.s43 * Constants.width,
                width: AppWidth.s34 * Constants.width,
              ),
              title: Text(
                userName!,
                style: getMediumStyle(color: ColorsManager.davysGrey, fontSize: AppWidth.s14 * Constants.width),
              ),
              contentPadding: EdgeInsets.only(
                top: AppHeight.s5 * Constants.height,
                  left: AppWidth.s9 * Constants.width,
                  right: AppWidth.s27 * Constants.width,
                  bottom: AppHeight.s9 * Constants.height),
              horizontalTitleGap: AppWidth.s14 * Constants.width,
              visualDensity: VisualDensity.compact,
              dense: true,
              trailing: SvgPicture.asset(
                AssetsManager.arrow,
                fit: BoxFit.fill,
              ),
            ),
          )
        : ShimmerWidget(
            height: AppHeight.s50 * Constants.height,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [BoxShadow(color: ColorsManager.black.withOpacity(0.07), blurRadius: 21)],
          );
  }
}
