import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class CustomDropTile extends StatefulWidget {
  String? _text;

  Function(bool expand)? _onTap;
  bool? _isLoaded;
  CustomDropTile({
    required String text,
    bool isLoaded = false,
    Function(bool expand)? onTap,
    Key? key,
  }) : super(key: key) {
    _text = text;
    _onTap = onTap;
    _isLoaded = isLoaded;
  }

  @override
  State<CustomDropTile> createState() => _CustomDropTileState();
}

class _CustomDropTileState extends State<CustomDropTile> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget._isLoaded!) {
          setState(() {
            expand = !expand;
          });
          if (widget._onTap != null) widget._onTap!(expand);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            left: AppWidth.s45 * Constants.width,
            right: AppWidth.s21 * Constants.width,
            top: AppWidth.s18 * Constants.width,
            bottom: AppWidth.s18 * Constants.width),
        decoration: BoxDecoration(
          color: expand
              ? ColorsManager.maximumPurple.withOpacity(0.08)
              : ColorsManager.whiteGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(// set widgets horizontally
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget._text!,
              style: getMediumStyle(
                fontSize: AppWidth.s14 * Constants.width,
                color: ColorsManager.graniteGray2,
              ),
            ),
            AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: widget._isLoaded!
                    ? RotatedBox(
                        quarterTurns: expand ? 2 : 4,
                        child: SvgPicture.asset(
                          AssetsManager.dropDown,
                          fit: BoxFit.none,
                        ),
                      )
                    : SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: ColorsManager.maximumPurple,
                          strokeWidth: 1,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
