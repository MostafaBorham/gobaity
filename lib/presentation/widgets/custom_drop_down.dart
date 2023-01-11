import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_drop_tile.dart';

class CustomDropDown extends StatefulWidget {
  String? _text;
  List<ItemModel>? _items;
  Function(List<ItemModel>)? _selectedTags;
  bool? _isLoaded;
  CustomDropDown({super.key,
    required String text,
    required List<ItemModel> items,
    required Function(List<ItemModel> value) selectedTags,
    bool isLoaded = false,
  }) {
    _text = text;
    _isLoaded = isLoaded;
    _items = items;
    _selectedTags = selectedTags;
  }

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<ItemModel> selected = [];

  bool _expand = false;

  late ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    //   controller.tags = _tags;
    _scrollController = ScrollController();
    // TODO: implement build
    return Column(//set widgets vertically
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropTile(
          text: 'Add Categories',
          isLoaded: widget._isLoaded!,
          onTap: (expand) {
            setState(() {
              _expand = expand;
            });
          },
        ),
        _buildDropDown(),
        _showSelectedItems()
      ],
    );
  }

  _buildDropDown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.s11 * Constants.width),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: _expand ? 200 : 500),
        switchInCurve: Curves.easeInSine,
        switchOutCurve: Curves.fastLinearToSlowEaseIn,
        child: _expand
            ? ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    maxHeight: AppHeight.s150 * Constants.height),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorsManager.brightGray2,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Scrollbar(
                    thickness: 3,
                    interactive: true,
                    trackVisibility: true,
                    radius: Radius.circular(0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppHeight.s20 * Constants.height,
                          horizontal: AppWidth.s28 * Constants.width,
                        ),
                        child: Wrap(
                          spacing: AppWidth.s19 * Constants.width,
                          runSpacing: AppHeight.s8 * Constants.height,
                          children: widget._items!
                              .map((e) => GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      setState(() {
                                        e.active = !e.active;
                                        if (e.active) {
                                          selected.add(e);
                                        } else {
                                          selected.remove(e);
                                        }
                                        widget._selectedTags!(selected);
                                      });
                                    },
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minWidth:
                                            AppWidth.s95 * Constants.width,
                                      ),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: e.active
                                              ? ColorsManager.maximumPurple
                                              : ColorsManager.brightGray2,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: ColorsManager.graniteGray,
                                              width: 1,
                                              style: BorderStyle.solid),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: AppHeight.s7*Constants.height,
                                          ),
                                          child: Text(
                                            e.title,
                                            textAlign: TextAlign.center,
                                            style: getMediumStyle(
                                                fontSize: AppWidth.s14 *
                                                    Constants.width,
                                                color: e.active
                                                    ? ColorsManager.white
                                                    : ColorsManager
                                                        .graniteGray),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  _showSelectedItems() => AnimatedContainer(
        duration: Duration(seconds: 0),
        curve: Curves.fastLinearToSlowEaseIn,
        padding: EdgeInsets.only(
            right: AppWidth.s11 * Constants.width,
            left: AppWidth.s11 * Constants.width),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: selected.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppHeight.s10 * Constants.height),
                  child: Wrap(
                    runSpacing: AppHeight.s8 * Constants.height,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: AppWidth.s19 * Constants.width,
                    alignment: WrapAlignment.start,
                    children: selected
                        .map((e) => ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: AppWidth.s123 * Constants.width,
                              ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: e.active
                                      ? ColorsManager.maximumPurple
                                      : ColorsManager.brightGray2,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: ColorsManager.graniteGray,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppHeight.s7*Constants.height,
                                  ),
                                  child: Row(// set widgets horizontally
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        e.title,
                                        textAlign: TextAlign.center,
                                        style: getMediumStyle(
                                          fontSize:
                                              AppWidth.s14 * Constants.width,
                                          color: e.active
                                              ? ColorsManager.white
                                              : ColorsManager.graniteGray,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppWidth.s13 * Constants.width,
                                      ),
                                      GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () {
                                            setState(() {
                                              selected.remove(e);
                                              e.active = false;

                                              widget._selectedTags!(selected);
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            AssetsManager.removeTag,
                                            height:
                                                AppWidth.s11 * Constants.width,
                                            width:
                                                AppWidth.s11 * Constants.width,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              : null,
        ),
      );
}
