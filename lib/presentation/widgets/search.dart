import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';

class Search extends StatelessWidget {
  void Function()? _onTap;
  void Function(String)? _onChanged;
  void Function(String)? _onSubmitted;
  void Function()? _onFilterPressed;
  Color? _color;
  String? _hintText;
  bool? _showFilter;
  Search({super.key,
    required String hintText,
    Color color = ColorsManager.cultured,
    bool showFilter = false,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    void Function()? onTap,
    void Function()? onFilterPressed,

  }) {
    _onChanged = onChanged;
    _onSubmitted = onSubmitted;
    _onTap = onTap;
    _hintText = hintText;
    _color = color;
    _showFilter = showFilter;
    _onFilterPressed=onFilterPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Row(// set widgets horizontally
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: AppHeight.s5*Constants.height),
            decoration: BoxDecoration(
                color: _color, borderRadius: BorderRadius.circular(15)),
            child: TextField(
              cursorColor: ColorsManager.steelPink,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIconConstraints: BoxConstraints(
                    minHeight: AppWidth.s18_38*Constants.width, minWidth: AppWidth.s18_38*Constants.width),
                prefixIcon: GestureDetector(
                  onTap: _onTap,
                  behavior: HitTestBehavior.deferToChild,
                  child: Row(// set widgets horizontally
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: AppWidth.s24_78*Constants.width,
                      ),
                      SvgPicture.asset(
                        AssetsManager.search,
                      ),
                      SizedBox(
                        width: AppWidth.s15_84*Constants.width,
                      )
                    ],
                  ),
                ),
                border: InputBorder.none,
                hintText: _hintText,
                hintStyle: getMediumStyle(
                  color: ColorsManager.nickel,
                  fontSize: AppWidth.s14*Constants.width,
                ),
              ),
              onChanged: _onChanged,
              onSubmitted: _onSubmitted,
            ),
          ),
        ),
        if (_showFilter!)
          Row(// set widgets horizontally
            children: [
              SizedBox(
                width: AppWidth.s10*Constants.width,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _onFilterPressed,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.s16*Constants.width,
                    vertical: AppHeight.s12*Constants.height,
                  ),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SvgPicture.asset(
                    AssetsManager.filter,
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
