import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(//set widgets vertically
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(// set widgets horizontally
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: getMediumStyle(
                  color: ColorsManager.black.withOpacity(0.8),
                  fontSize: AppWidth.s16*Constants.width),
            ),
            Text(
              '230.00 EGP',
              style: getSemiBoldStyle(
                  color: ColorsManager.black.withOpacity(0.8),
                  fontSize: AppWidth.s16*Constants.width),
            ),
          ],
        ),
        SizedBox(
          height: AppHeight.s16*Constants.height,
        ),
        Row(// set widgets horizontally
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery',
              style: getMediumStyle(
                  color: ColorsManager.black.withOpacity(0.8),
                  fontSize: AppWidth.s16*Constants.width),
            ),
            Text(
              '15.00 EGP',
              style: getSemiBoldStyle(
                  color: ColorsManager.black.withOpacity(0.8),
                  fontSize: AppWidth.s16*Constants.width),
            ),
          ],
        ),
        SizedBox(
          height: AppHeight.s16*Constants.height,
        ),
        Row(// set widgets horizontally
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TOTAL',
              style: getSemiBoldStyle(
                  color: ColorsManager.black.withOpacity(0.8),
                  fontSize: AppWidth.s18*Constants.width),
            ),
            Text(
              '230.00 EGP',
              style: getSemiBoldStyle(
                  color: ColorsManager.black.withOpacity(0.8),
                  fontSize: AppWidth.s18*Constants.width),
            ),
          ],
        ),
      ],
    );
  }
}
