import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class CustomTabBarWidget extends StatefulWidget {
  int? _itemCount;
  Widget Function(int index)? _itemBuilder;
  CustomTabBarWidget({
    required int itemCount,
    required Widget Function(int index) itemBuilder,
    super.key,
  }) {
    //print(tabList.hashCode);
    _itemCount = itemCount;
    _itemBuilder = itemBuilder;
  }

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  @override
  Widget build(BuildContext context) {
   debugPrint('build');
    return Wrap(
        alignment: WrapAlignment.center,
        spacing: Constants.margin,
        direction: Axis.horizontal,
        children: [
          for (int index = 0; index < widget._itemCount!; index++)
            widget._itemBuilder!(index)
        ]);
  }
}
