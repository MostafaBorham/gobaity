import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_button.dart';

import '../manager/cubit_user_manager/cubit_user.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        //UserCubit.getUserEvent(context);
        return Scaffold(
        body: Stack(
          children: [
            Image.asset(AssetsManager.splash),
            Positioned.fill(
              top: AppHeight.s70 * Constants.height,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Constants.margin), child: Image.asset(AssetsManager.splashLogo)),
              ),
            ),
            Positioned.fill(
              bottom: AppHeight.s66 * Constants.height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: CustomButton(
                      text: 'Get Started',
                      onPressed: () {
                       debugPrint('pressed');
                        Navigator.of(context).popAndPushNamed(
                          Routes.homeRoute,
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
      },
    );
  }

  @override
  void dispose() {
/*
    _translationAnimationController.dispose();
    _opacityAnimationController.dispose();
*/

    super.dispose();
  }
}
