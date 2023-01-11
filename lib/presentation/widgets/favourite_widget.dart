import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';

class FavouriteWidget extends StatefulWidget {
  bool? _isFavourited;
  double? _radius;
  Function(bool value)? _onFavouriteBtnPressed;
  FavouriteWidget(
      {bool isFavourited = false,
      double radius = 20,
      Function(bool value)? onFavouriteBtnPressed,
      Key? key})
      : super(key: key) {
    _isFavourited = isFavourited;
    _radius = radius;
    _onFavouriteBtnPressed = onFavouriteBtnPressed;
  }

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return CircularIconButton(
        radius: widget._radius!,
        asset: widget._isFavourited!
            ? AssetsManager.favourited
            : AssetsManager.favourite,
        color: ColorsManager.white,
        ontap: () {
         debugPrint(widget._isFavourited.toString() );
          if (widget._onFavouriteBtnPressed != null) {
            widget._isFavourited = !widget._isFavourited!;
            widget._onFavouriteBtnPressed!(widget._isFavourited!);
          }
        });
  }
}
