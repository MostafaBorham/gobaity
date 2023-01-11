import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_multiple_checkbox.dart';

class CustomMultipleListCheckBox extends StatefulWidget {
  List<ItemModel>? _multipleCheckBoxList;
  void Function(ItemModel selected)? _onItemSelected;
  CustomMultipleListCheckBox (
      {List<ItemModel>? multipleCheckBoxList,
        void Function(ItemModel items)? onItemSelected,
        Key? key})
      : super(key: key) {
    _multipleCheckBoxList =multipleCheckBoxList;
    _onItemSelected = onItemSelected;
  }

  @override
  State<CustomMultipleListCheckBox > createState() =>
      _CustomMultipleListCheckBoxState();
}

class _CustomMultipleListCheckBoxState extends State<CustomMultipleListCheckBox > {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget._multipleCheckBoxList!.length,
      physics: BouncingScrollPhysics(),

      itemBuilder: (context, index) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {

          setState(() {
            widget._multipleCheckBoxList![index].active =
            !widget._multipleCheckBoxList![index].active;
          });

        },
        child: CustomMultipleCheckBox(
          text: widget._multipleCheckBoxList![index].title,
          isChecked: widget._multipleCheckBoxList![index].active,
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: AppHeight.s29*Constants.height,
      ),
    );
  }

}
