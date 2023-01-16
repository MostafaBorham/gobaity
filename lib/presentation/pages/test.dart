

import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';

import '../resources/assets_manager.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/linear_gradient_body.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearGradientBody(
      appbarTitle: 'Orders',
      showCart: false,
      onBackPressed: () {
        Navigator.of(context).pop();
      },
      child: Container(
        child: Column(
          children: [
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: CircularIconButton(
                asset: AssetsManager.add,
                color: ColorsManager.yellow,
              ),
            )
          ],
        ),
      ),

    );
  }
}
