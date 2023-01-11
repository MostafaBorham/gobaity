import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/linear_gradient_body.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_button.dart';

class DoneScreen extends StatelessWidget {
  DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearGradientBody(
      showCart: false,
      showBack: false,onBackPressed: () {

      },
      onCartPressed: () {

      },

      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.margin),
          child: Column(//set widgets vertically
            children: [
              SvgPicture.asset(AssetsManager.done),
              SizedBox(
                height: AppHeight.s45*Constants.height,
              ),
              Text('Thank you',style: getSemiBoldStyle(
                color: ColorsManager.eerieBlack,
                fontSize: AppWidth.s20*Constants.width
              )),
              SizedBox(
                height: AppHeight.s22*Constants.height,
              ),
              Text('Your Order has been placed Successfully',
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                fontSize: AppWidth.s19*Constants.width,
                color: ColorsManager.davysGrey,
              )),
              SizedBox(
                height: AppHeight.s200*Constants.height,
              ),
              SizedBox(
                width: double.maxFinite,
                  child: CustomButton(
                text: 'Back to Homepage',
                onPressed: () {},
              ))
            ],
          ),
        ),
      ),
    );
  }
}
