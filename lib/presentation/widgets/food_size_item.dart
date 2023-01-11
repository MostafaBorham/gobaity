import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/data_models/size_model.dart';

import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/strings_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_checkbox.dart';

import '../../application/types.dart';
import 'increase_and_decrease_widget.dart';

class FoodSizeItem extends StatefulWidget {
  final SizeModel? foodSize;
  final void Function(bool)? onCheck;
  final Function(int value)? onIncrementAndDecrementChange;
  final VoidFunction onAddToCartPressed;
  final String buttonText;
  final bool showCircular;
  final Color buttonColor;
  const FoodSizeItem(
      {super.key,
      required this.buttonText,   required this.showCircular,
        required this.buttonColor ,
      required this.foodSize,
      this.onCheck,

      this.onAddToCartPressed,
      this.onIncrementAndDecrementChange,
      });

  @override
  State<FoodSizeItem> createState() => _FoodSizeItemState();
}

class _FoodSizeItemState extends State<FoodSizeItem> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Column(//set widgets vertically
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidth.s25 * Constants.width),
            child: Row(// set widgets horizontally
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckBox(
                  isChecked: _checked,
                  onCheck: (checked) {
                    setState(() {
                      _checked = !_checked;
                    });
                  },
                ),
                SizedBox(
                  width: AppWidth.s21 * Constants.width,
                ),
                Column(//set widgets vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.foodSize!.sizeName!,
                      style: getMediumStyle(
                        color: ColorsManager.black,
                        fontSize: AppWidth.s16 * Constants.width,
                      ),
                    ),
                    Text(
                      '${widget.foodSize!.price!} EGP',
                      style: getSemiBoldStyle(
                        color: ColorsManager.maximumPurple,
                        fontSize: AppWidth.s16 * Constants.width,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: AppHeight.s14 * Constants.height,
          ),
          Padding(
            padding: EdgeInsets.only(left: AppWidth.s70 * Constants.width, right: AppWidth.s24 * Constants.width),
            child: Text(
              widget.foodSize!.sizeDescription!,
              style: getMediumStyle(fontSize: AppWidth.s14 * Constants.width, color: ColorsManager.graniteGray),
            ),
          ),
          SizedBox(
            height: AppHeight.s15 * Constants.height,
          ),
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: _checked
                ? Container(
                    color: ColorsManager.brightGray,
                    padding: EdgeInsets.symmetric(vertical: AppHeight.s16 * Constants.height),
                    child: Row(// set widgets horizontally
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IncrementAndDecrementWidget(
                          onIncrementAndDecrementChange: widget.onIncrementAndDecrementChange,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppWidth.s22 * Constants.width),
                          child: SizedBox(
                            width: AppWidth.s164 * Constants.width,
                            height: AppWidth.s56 * Constants.width,
                            child: ElevatedButton(
                              onPressed: widget.onAddToCartPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: widget.buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              child: Row(// set widgets horizontally
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 5),
                                    child: widget.showCircular
                                        ? Row(// set widgets horizontally
                                            children: [
                                              SizedBox(
                                                height: AppHeight.s15 * Constants.height,
                                                width: AppWidth.s15 * Constants.width,
                                                child: const CircularProgressIndicator(
                                                  color: ColorsManager.white,
                                                  strokeWidth: 1,
                                                ),
                                              ),
                                              SizedBox(
                                                width: AppWidth.s10 * Constants.width,
                                              ),
                                            ],
                                          )
                                        : null,
                                  ),
                                  Text(
                                    widget.buttonText,
                                    style: getMediumStyle(
                                      fontSize: AppWidth.s16 * Constants.width,
                                      color: ColorsManager.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : null,
          )
        ],
      ),
    );
  }
}
