import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/cart_item.dart';
import 'package:yallabaity/presentation/widgets/linear_gradient_body.dart';
import 'package:yallabaity/presentation/pages/food_details_screen.dart';
import 'package:yallabaity/presentation/widgets/food_item.dart';


class SavedScreen extends StatelessWidget {
  SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearGradientBody(
      appbarTitle: 'Saved',
      onBackPressed: () {
        Navigator.of(context).pop();
      },
      showCart: false,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.s30*Constants.width),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(//set widgets vertically
              children: [
                SizedBox(
                  height: AppHeight.s30*Constants.height,
                ),
                _buildFoods(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFoods() => ListView.separated(
        itemCount: FoodModel.all.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return FoodItem(
            food: FoodModel.all[index],
            onTap: () {
              Navigator.of(context).pushNamed(Routes.foodDetailsRoute,
                  arguments: {
                    FoodDetailsScreen.foodIdKey: FoodModel.all[index]
                  });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: AppHeight.s25*Constants.height,
        ),
      );
}
