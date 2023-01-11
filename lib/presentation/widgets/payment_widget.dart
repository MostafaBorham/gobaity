import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_tile_%20button.dart';
import 'package:yallabaity/presentation/widgets/custom_checkbox.dart';

class PaymentWidget extends StatefulWidget {
  Function(int index)? _selectedItem;

  PaymentWidget({Function(int index)? selectedItem, Key? key})
      : super(key: key) {
    _selectedItem = selectedItem;
  }

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  List<ItemModel> methods = [
    ItemModel(title: 'Cash', icon: AssetsManager.cash, active: true),
    ItemModel(title: 'Debti/Credit card', icon: AssetsManager.credit),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: methods.length,
      itemBuilder: (context, index) => CustomTileButton(
        prefixAsset: methods[index].icon,
        text: methods[index].title,
        suffix: CustomCheckBox(
          height: AppWidth.s14*Constants.width,
          width: AppWidth.s14*Constants.width,
          isChecked: methods[index].active,
        ),
        padding: EdgeInsets.only(left: AppWidth.s14*Constants.width, right: AppWidth.s28*Constants.width),
        onTap: () {
          setState(() {
            methods[currentIndex].active = false;
            methods[index].active = !methods[index].active;
            currentIndex = index;
            if (widget._selectedItem != null) {
              widget._selectedItem!(index);
            }
          });
        },
      ),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: AppHeight.s18*Constants.height,
      ),
    );
  }
}
