import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_tile_%20button.dart';
import 'package:yallabaity/presentation/widgets/linear_gradient_body.dart';
import 'package:yallabaity/presentation/widgets/custom_appbar.dart';
import 'package:yallabaity/presentation/widgets/custom_button.dart';

class ProviderProfileScreen extends StatelessWidget {
  ProviderProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearGradientBody(
      appbarTitle: 'My Profile',
      showCart: false,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidth.s31*Constants.width),
            child: Column(//set widgets vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppHeight.s15*Constants.height,
                ),
                Text(
                  'Mohamed Ghitany',
                  style: getSemiBoldStyle(
                      fontSize: AppWidth.s18*Constants.width,
                      color: ColorsManager.maximumPurple),
                ),
                SizedBox(
                  height: AppHeight.s4*Constants.height,
                ),
                Text(
                  '0107 387 3899',
                  style: getSemiBoldStyle(
                      fontSize: AppWidth.s14*Constants.width,
                      color: ColorsManager.maximumPurple.withOpacity(0.71)),
                ),
                SizedBox(
                  height: AppHeight.s30*Constants.height,
                ),
                Text(
                  '30.00 EGP',
                  style: getSemiBoldStyle(
                      fontSize: AppWidth.s18*Constants.width,
                      color: ColorsManager.maximumPurple),
                ),
                SizedBox(
                  height: AppHeight.s30*Constants.height,
                ),
                CustomTileButton(
                  text: 'My Wallet',
                  suffixAsset: AssetsManager.arrow,
                ),
                SizedBox(
                  height: AppHeight.s18*Constants.height,
                ),
                CustomTileButton(
                  text: 'My Food',
                  suffixAsset: AssetsManager.arrow,
                ),
                SizedBox(
                  height: AppHeight.s18*Constants.height,
                ),
                CustomTileButton(
                  text: 'Orders History',
                  suffixAsset: AssetsManager.arrow,
                ),
                SizedBox(
                  height: AppHeight.s18*Constants.height,
                ),
                CustomTileButton(
                  text: 'Saved Items',
                  suffixAsset: AssetsManager.arrow,
                ),
                SizedBox(
                  height: AppHeight.s18*Constants.height,
                ),
                CustomTileButton(
                  text: 'Account Info',
                  suffixAsset: AssetsManager.arrow,
                ),
                SizedBox(
                  height: AppHeight.s18*Constants.height,
                ),
                CustomTileButton(
                  text: 'Language',
                  suffix: Text(
                    'English',
                    style: getSemiBoldStyle(
                      fontSize: AppWidth.s14*Constants.width,
                      color: ColorsManager.pixiePowder,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                  suffixAsset: AssetsManager.arrow,
                ),
                SizedBox(
                  height: AppHeight.s50*Constants.height,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: CustomButton(
                    text: 'Log out',
                    outlined: true,
                    onPressed: () {},
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
