import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/gobaity_app.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/increase_and_decrease_widget.dart';

import '../../domain/entities/requests_entites/food_entity.dart';

class CartItem extends StatelessWidget {
  bool? _showCountAndDeleteItem;
  FoodEntity? _item;
  CartItem({required FoodEntity item,bool showCountAndDeleteItem = true, super.key}) {
    _showCountAndDeleteItem = showCountAndDeleteItem;
    _item=item;
  }

  @override
  Widget build(BuildContext context) {
    return Row(// set widgets horizontally
      children: [
        Container(
          height: AppHeight.s121*Constants.height,
          width: AppWidth.s119*Constants.width,
          clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11)
          ),
          child: Image.asset(
            _item!.imagePath![0],
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: AppWidth.s21*Constants.width,
        ),
        Expanded(
          child: Column(//set widgets vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _item!.price!.toString(),
                style: getSemiBoldStyle(
                    color: ColorsManager.maximumPurple,
                    fontSize: AppWidth.s16*Constants.width),
              ),
              SizedBox(
                height: AppHeight.s8*Constants.height,
              ),
              Text(
                'Molokheya & Chicken',
                style: getSemiBoldStyle(
                    color: ColorsManager.black, fontSize: AppWidth.s14*Constants.width),
              ),
              SizedBox(
                height: AppHeight.s1*Constants.height,
              ),
              Text(
                'Large Size',
                style: getMediumStyle(
                    color: ColorsManager.graniteGray, fontSize: AppWidth.s14*Constants.width),
              ),
              SizedBox(
                height: AppHeight.s11*Constants.height,
              ),
              if (_showCountAndDeleteItem!)
                Row(// set widgets horizontally
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IncrementAndDecrementWidget(
                      onIncrementAndDecrementChange: (orders) {},
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: SvgPicture.asset(
                        AssetsManager.delete,
                        height: AppWidth.s15*Constants.width,
                        width: AppWidth.s15*Constants.width,
                      ),
                    ),
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
