import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/food_status.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/cart_item.dart';
import 'package:yallabaity/presentation/widgets/linear_gradient_body.dart';


class OrdersHistoryScreen extends StatelessWidget {
   OrdersHistoryScreen({Key? key}) : super(key: key);
  List<FoodStatus> list = [
    FoodStatus(date: 'Yesterday', list: FoodModel.all),
    FoodStatus(date: '3 days ago', list: FoodModel.all),
  ];
  @override
  Widget build(BuildContext context) {
    return LinearGradientBody(
      appbarTitle: 'Orders History',
      showCart: false,
      onBackPressed: () {
        Navigator.of(context).pop();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ListView.separated(
            shrinkWrap: true,
            primary: false,
            physics: BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  left: Constants.margin,
                  right: Constants.margin,
                  bottom:
                  index + 1 == list.length ? AppHeight.s100*Constants.height : 0,
                 ),
              child: Column(//set widgets vertically
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list[index].date!,
                    style: getSemiBoldStyle(
                        fontSize: AppWidth.s17*Constants.width,
                        color: ColorsManager.eerieBlack),
                  ),
                  SizedBox(
                    height: AppHeight.s12*Constants.height,
                  ),
                  _buildItems(index)
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(
                  height: AppHeight.s19*Constants.height,
                ),
          ),
        ),
      ),
    );
  }

   _buildItems(int index) => ListView.separated(
     shrinkWrap: true,
     physics: BouncingScrollPhysics(),
     itemCount: list[index].list!.length,
     itemBuilder: (context, i) => Padding(
       padding: EdgeInsets.symmetric(horizontal: AppWidth.s17*Constants.width),
       child: CartItem(
         showCountAndDeleteItem: false,
         item: list[index].list![i],
       ),
     ),
     separatorBuilder: (BuildContext context, int i) => SizedBox(
       height: AppHeight.s19*Constants.height,
     ),
   );
}
